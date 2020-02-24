require 'test_helper'

class ExpensesDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @expenses_detail = expenses_details(:one)
  end

  test "should get index" do
    get expenses_details_url
    assert_response :success
  end

  test "should get new" do
    get new_expenses_detail_url
    assert_response :success
  end

  test "should create expenses_detail" do
    assert_difference('ExpensesDetail.count') do
      post expenses_details_url, params: { expenses_detail: { amount: @expenses_detail.amount, bill_id: @expenses_detail.bill_id, concept_id: @expenses_detail.concept_id } }
    end

    assert_redirected_to expenses_detail_url(ExpensesDetail.last)
  end

  test "should show expenses_detail" do
    get expenses_detail_url(@expenses_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_expenses_detail_url(@expenses_detail)
    assert_response :success
  end

  test "should update expenses_detail" do
    patch expenses_detail_url(@expenses_detail), params: { expenses_detail: { amount: @expenses_detail.amount, bill_id: @expenses_detail.bill_id, concept_id: @expenses_detail.concept_id } }
    assert_redirected_to expenses_detail_url(@expenses_detail)
  end

  test "should destroy expenses_detail" do
    assert_difference('ExpensesDetail.count', -1) do
      delete expenses_detail_url(@expenses_detail)
    end

    assert_redirected_to expenses_details_url
  end
end
