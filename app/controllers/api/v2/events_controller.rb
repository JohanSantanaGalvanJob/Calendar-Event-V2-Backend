class Api::V2::EventsController < ApplicationController
  before_action :set_event, only: %i[ show update destroy ]

  # GET /events
  def index
    @events = Event.all

    render json: @events
  end

  # GET /events/1
  def show
    # @user = User.find(params[:id])
    render json: { event: @event, image_url: url_for(@event.image) }
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if params[:event][:image].present?
      @event.image.attach(params[:event][:image])
    end

    if @event.save
      render json: { event: @event, image_url: url_for(@event.image) }, status: :created, location: @event
    else
      render json: { errors: @event.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :description, :date, :starting_hour, :url, :location_id, :event_category_id, :image)
    end
end
