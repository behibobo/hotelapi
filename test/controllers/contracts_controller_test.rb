require 'test_helper'

class ContractsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contract = contracts(:one)
  end

  test "should get index" do
    get contracts_url, as: :json
    assert_response :success
  end

  test "should create contract" do
    assert_difference('Contract.count') do
      post contracts_url, params: { contract: { from_date: @contract.from_date, hotel_id: @contract.hotel_id, status: @contract.status, to_date: @contract.to_date } }, as: :json
    end

    assert_response 201
  end

  test "should show contract" do
    get contract_url(@contract), as: :json
    assert_response :success
  end

  test "should update contract" do
    patch contract_url(@contract), params: { contract: { from_date: @contract.from_date, hotel_id: @contract.hotel_id, status: @contract.status, to_date: @contract.to_date } }, as: :json
    assert_response 200
  end

  test "should destroy contract" do
    assert_difference('Contract.count', -1) do
      delete contract_url(@contract), as: :json
    end

    assert_response 204
  end
end
