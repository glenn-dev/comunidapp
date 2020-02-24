require "application_system_test_case"

class BillsTest < ApplicationSystemTestCase
  setup do
    @bill = bills(:one)
  end

  test "visiting the index" do
    visit bills_url
    assert_selector "h1", text: "Bills"
  end

  test "creating a Bill" do
    visit bills_url
    click_on "New Bill"

    fill_in "Bill doc", with: @bill.bill_doc
    fill_in "Department", with: @bill.department_id
    fill_in "Issue date", with: @bill.issue_date
    fill_in "Num bill", with: @bill.num_bill
    fill_in "Paid doc", with: @bill.paid_doc
    check "Status" if @bill.status
    fill_in "Total", with: @bill.total
    click_on "Create Bill"

    assert_text "Bill was successfully created"
    click_on "Back"
  end

  test "updating a Bill" do
    visit bills_url
    click_on "Edit", match: :first

    fill_in "Bill doc", with: @bill.bill_doc
    fill_in "Department", with: @bill.department_id
    fill_in "Issue date", with: @bill.issue_date
    fill_in "Num bill", with: @bill.num_bill
    fill_in "Paid doc", with: @bill.paid_doc
    check "Status" if @bill.status
    fill_in "Total", with: @bill.total
    click_on "Update Bill"

    assert_text "Bill was successfully updated"
    click_on "Back"
  end

  test "destroying a Bill" do
    visit bills_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bill was successfully destroyed"
  end
end
