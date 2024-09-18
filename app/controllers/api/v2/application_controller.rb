class Api::V2::ApplicationController < ActionController::API

  def authenticate_user
    token = request.headers['Authorization']
    decoded_token = decode_token(token)

    if decoded_token
      user_id = decoded_token[0]['user_id']
      @current_user = User.find(user_id)
    else
      render json: { error: 'Unauthorized access' }, status: :unauthorized
    end
  end

  def decode_token(token)
    begin
      JWT.decode(token, Rails.application.secret_key_base, true, algorithm: 'HS256')
    rescue JWT::DecodeError
      nil
    end
  end

end
