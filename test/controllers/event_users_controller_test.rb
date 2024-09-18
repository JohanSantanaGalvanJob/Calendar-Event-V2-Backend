require "test_helper"

class EventUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_user = event_users(:one)
  end

  test "should get index" do
    get event_users_url, as: :json
    assert_response :success
  end

  test "should create event_user" do
    assert_difference("EventUser.count") do
      post event_users_url, params: { event_user: {} }, as: :json
    end

    assert_response :created
  end

  test "should show event_user" do
    get event_user_url(@event_user), as: :json
    assert_response :success
  end

  test "should update event_user" do
    patch event_user_url(@event_user), params: { event_user: {} }, as: :json
    assert_response :success
  end

  test "should destroy event_user" do
    assert_difference("EventUser.count", -1) do
      delete event_user_url(@event_user), as: :json
    end

    assert_response :no_content
  end
end
