class Api::V2::AuthController < ApplicationController
  before_action :authorize_request, only: [:profile]
  # POST /signup
  def signup
    @user = User.new(user_params)
    if @user.save
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

 # GET /profile
  def profile
    if @current_user
      render json: {
        user: {
          id: @current_user.id,
          first_name: @current_user.first_name,
          last_name: @current_user.last_name,
          email: @current_user.email,
          birthdate: @current_user.birthdate,
          image_url: url_for(@current_user.image) # Genera la URL de la imagen
        }
      }, status: :ok
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  # POST /login
  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

   # Métodos auxiliares
   private

def authorize_request
  header = request.headers['Authorization']
  if header
    token = header.split(' ').last
    Rails.logger.info("Authorization token: #{token}")

    begin
      decoded = JWT.decode(token, Rails.application.secret_key_base)[0]
      Rails.logger.info("Decoded JWT: #{decoded}")

      @current_user = User.find_by(id: decoded["user_id"])
      Rails.logger.info("Current user: #{@current_user.inspect}")

      unless @current_user
        render json: { error: 'User not found' }, status: :not_found
      end
    rescue JWT::DecodeError => e
      Rails.logger.error("JWT Decode Error: #{e.message}")
      render json: { error: 'Invalid token' }, status: :unauthorized
    end
  else
    Rails.logger.error("Token not provided")
    render json: { error: 'Token not provided' }, status: :forbidden
  end
end

   def user_params
     params.require(:auth).permit(:first_name, :last_name, :email, :password, :birthdate, :password_confirmation, :image)
   end

   def encode_token(payload)
     JWT.encode(payload, Rails.application.secret_key_base)
   end
end
