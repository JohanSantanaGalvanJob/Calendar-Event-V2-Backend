class Api::V2::EventUsersController < ApplicationController
  before_action :set_event_user, only: %i[ show update destroy ]

  # GET /event_users
  def index
    @event_users = EventUser.all

    render json: @event_users
  end

  # GET /event_users/1
  def show
    render json: @event_user
  end

  # POST /event_users
  def create
    @event_user = EventUser.new(event_user_params)

    if @event_user.save
      render json: @event_user, status: :created, location: @event_user
    else
      render json: @event_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /event_users/1
  def update
    if @event_user.update(event_user_params)
      render json: @event_user
    else
      render json: @event_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /event_users/1
  def destroy
    @event_user.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_user
      @event_user = EventUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_user_params
      params.fetch(:event_user, {})
    end
end
