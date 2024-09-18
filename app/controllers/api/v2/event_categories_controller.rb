class Api::V2::EventCategoriesController < ApplicationController
  before_action :set_event_category, only: %i[ show update destroy ]

  # GET /event_categories
  def index
    @event_categories = EventCategory.all

    render json: @event_categories
  end

  # GET /event_categories/1
  def show
    render json: @event_category
  end

  # POST /event_categories
  def create
    @event_category = EventCategory.new(event_category_params)

    if @event_category.save
      render json: @event_category, status: :created, location: @event_category
    else
      render json: @event_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /event_categories/1
  def update
    if @event_category.update(event_category_params)
      render json: @event_category
    else
      render json: @event_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /event_categories/1
  def destroy
    @event_category.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_category
      @event_category = EventCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_category_params
      params.require(:event_category).permit(:name)
    end
end
