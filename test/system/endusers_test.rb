require "application_system_test_case"

class EndusersTest < ApplicationSystemTestCase
  setup do
    @enduser = endusers(:one)
  end

  test "visiting the index" do
    visit endusers_url
    assert_selector "h1", text: "Endusers"
  end

  test "creating a Enduser" do
    visit endusers_url
    click_on "New Enduser"

    fill_in "Email", with: @enduser.email
    fill_in "Name", with: @enduser.name
    fill_in "Phone", with: @enduser.phone
    click_on "Create Enduser"

    assert_text "Enduser was successfully created"
    click_on "Back"
  end

  test "updating a Enduser" do
    visit endusers_url
    click_on "Edit", match: :first

    fill_in "Email", with: @enduser.email
    fill_in "Name", with: @enduser.name
    fill_in "Phone", with: @enduser.phone
    click_on "Update Enduser"

    assert_text "Enduser was successfully updated"
    click_on "Back"
  end

  test "destroying a Enduser" do
    visit endusers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Enduser was successfully destroyed"
  end
end
