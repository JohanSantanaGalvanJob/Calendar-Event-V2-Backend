require "test_helper"

class EventCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_category = event_categories(:one)
  end

  test "should get index" do
    get event_categories_url, as: :json
    assert_response :success
  end

  test "should create event_category" do
    assert_difference("EventCategory.count") do
      post event_categories_url, params: { event_category: { name: @event_category.name } }, as: :json
    end

    assert_response :created
  end

  test "should show event_category" do
    get event_category_url(@event_category), as: :json
    assert_response :success
  end

  test "should update event_category" do
    patch event_category_url(@event_category), params: { event_category: { name: @event_category.name } }, as: :json
    assert_response :success
  end

  test "should destroy event_category" do
    assert_difference("EventCategory.count", -1) do
      delete event_category_url(@event_category), as: :json
    end

    assert_response :no_content
  end
end
