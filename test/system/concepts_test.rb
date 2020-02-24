require "application_system_test_case"

class ConceptsTest < ApplicationSystemTestCase
  setup do
    @concept = concepts(:one)
  end

  test "visiting the index" do
    visit concepts_url
    assert_selector "h1", text: "Concepts"
  end

  test "creating a Concept" do
    visit concepts_url
    click_on "New Concept"

    fill_in "Name", with: @concept.name
    click_on "Create Concept"

    assert_text "Concept was successfully created"
    click_on "Back"
  end

  test "updating a Concept" do
    visit concepts_url
    click_on "Edit", match: :first

    fill_in "Name", with: @concept.name
    click_on "Update Concept"

    assert_text "Concept was successfully updated"
    click_on "Back"
  end

  test "destroying a Concept" do
    visit concepts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Concept was successfully destroyed"
  end
end
