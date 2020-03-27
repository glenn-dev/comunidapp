require 'test_helper'

class GeneralExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @general_expense = general_expenses(:one)
  end

  test "should get index" do
    get general_expenses_url
    assert_response :success
  end

  test "should get new" do
    get new_general_expense_url
    assert_response :success
  end

  test "should create general_expense" do
    assert_difference('GeneralExpense.count') do
      post general_expenses_url, params: { general_expense: { amount: @general_expense.amount, building_id: @general_expense.building_id, concept_id: @general_expense.concept_id, status: @general_expense.status } }
    end

    assert_redirected_to general_expense_url(GeneralExpense.last)
  end

  test "should show general_expense" do
    get general_expense_url(@general_expense)
    assert_response :success
  end

  test "should get edit" do
    get edit_general_expense_url(@general_expense)
    assert_response :success
  end

  test "should update general_expense" do
    patch general_expense_url(@general_expense), params: { general_expense: { amount: @general_expense.amount, building_id: @general_expense.building_id, concept_id: @general_expense.concept_id, status: @general_expense.status } }
    assert_redirected_to general_expense_url(@general_expense)
  end

  test "should destroy general_expense" do
    assert_difference('GeneralExpense.count', -1) do
      delete general_expense_url(@general_expense)
    end

    assert_redirected_to general_expenses_url
  end
end
