require "application_system_test_case"

class CommunicationsTest < ApplicationSystemTestCase
  setup do
    @communication = communications(:one)
  end

  test "visiting the index" do
    visit communications_url
    assert_selector "h1", text: "Communications"
  end

  test "creating a Communication" do
    visit communications_url
    click_on "New Communication"

    fill_in "Building", with: @communication.building_id
    fill_in "Content", with: @communication.content
    fill_in "Document", with: @communication.document
    fill_in "Num release", with: @communication.num_release
    check "Status" if @communication.status
    fill_in "Title", with: @communication.title
    click_on "Create Communication"

    assert_text "Communication was successfully created"
    click_on "Back"
  end

  test "updating a Communication" do
    visit communications_url
    click_on "Edit", match: :first

    fill_in "Building", with: @communication.building_id
    fill_in "Content", with: @communication.content
    fill_in "Document", with: @communication.document
    fill_in "Num release", with: @communication.num_release
    check "Status" if @communication.status
    fill_in "Title", with: @communication.title
    click_on "Update Communication"

    assert_text "Communication was successfully updated"
    click_on "Back"
  end

  test "destroying a Communication" do
    visit communications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Communication was successfully destroyed"
  end
end
