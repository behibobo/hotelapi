require 'test_helper'

class PassengersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @passenger = passengers(:one)
  end

  test "should get index" do
    get passengers_url, as: :json
    assert_response :success
  end

  test "should create passenger" do
    assert_difference('Passenger.count') do
      post passengers_url, params: { passenger: { email: @passenger.email, first_name: @passenger.first_name, last_name: @passenger.last_name, password_digest: @passenger.password_digest, phone: @passenger.phone, status: @passenger.status } }, as: :json
    end

    assert_response 201
  end

  test "should show passenger" do
    get passenger_url(@passenger), as: :json
    assert_response :success
  end

  test "should update passenger" do
    patch passenger_url(@passenger), params: { passenger: { email: @passenger.email, first_name: @passenger.first_name, last_name: @passenger.last_name, password_digest: @passenger.password_digest, phone: @passenger.phone, status: @passenger.status } }, as: :json
    assert_response 200
  end

  test "should destroy passenger" do
    assert_difference('Passenger.count', -1) do
      delete passenger_url(@passenger), as: :json
    end

    assert_response 204
  end
end
