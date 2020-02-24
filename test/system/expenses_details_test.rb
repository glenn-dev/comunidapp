require "application_system_test_case"

class ExpensesDetailsTest < ApplicationSystemTestCase
  setup do
    @expenses_detail = expenses_details(:one)
  end

  test "visiting the index" do
    visit expenses_details_url
    assert_selector "h1", text: "Expenses Details"
  end

  test "creating a Expenses detail" do
    visit expenses_details_url
    click_on "New Expenses Detail"

    fill_in "Amount", with: @expenses_detail.amount
    fill_in "Bill", with: @expenses_detail.bill_id
    fill_in "Concept", with: @expenses_detail.concept_id
    click_on "Create Expenses detail"

    assert_text "Expenses detail was successfully created"
    click_on "Back"
  end

  test "updating a Expenses detail" do
    visit expenses_details_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @expenses_detail.amount
    fill_in "Bill", with: @expenses_detail.bill_id
    fill_in "Concept", with: @expenses_detail.concept_id
    click_on "Update Expenses detail"

    assert_text "Expenses detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Expenses detail" do
    visit expenses_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Expenses detail was successfully destroyed"
  end
end
