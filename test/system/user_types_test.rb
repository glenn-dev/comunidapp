require "application_system_test_case"

class UserTypesTest < ApplicationSystemTestCase
  setup do
    @user_type = user_types(:one)
  end

  test "visiting the index" do
    visit user_types_url
    assert_selector "h1", text: "User Types"
  end

  test "creating a User type" do
    visit user_types_url
    click_on "New User Type"

    fill_in "Name", with: @user_type.name
    click_on "Create User type"

    assert_text "User type was successfully created"
    click_on "Back"
  end

  test "updating a User type" do
    visit user_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @user_type.name
    click_on "Update User type"

    assert_text "User type was successfully updated"
    click_on "Back"
  end

  test "destroying a User type" do
    visit user_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User type was successfully destroyed"
  end
end
