require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get events_url, as: :json
    assert_response :success
  end

  test "should create event" do
    assert_difference("Event.count") do
      post events_url, params: { event: { date: @event.date, description: @event.description, event_category_id: @event.event_category_id, location_id: @event.location_id, starting_hour: @event.starting_hour, title: @event.title, url: @event.url } }, as: :json
    end

    assert_response :created
  end

  test "should show event" do
    get event_url(@event), as: :json
    assert_response :success
  end

  test "should update event" do
    patch event_url(@event), params: { event: { date: @event.date, description: @event.description, event_category_id: @event.event_category_id, location_id: @event.location_id, starting_hour: @event.starting_hour, title: @event.title, url: @event.url } }, as: :json
    assert_response :success
  end

  test "should destroy event" do
    assert_difference("Event.count", -1) do
      delete event_url(@event), as: :json
    end

    assert_response :no_content
  end
end
