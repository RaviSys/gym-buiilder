require "application_system_test_case"

class MembersTest < ApplicationSystemTestCase
  setup do
    @member = members(:one)
  end

  test "visiting the index" do
    visit members_url
    assert_selector "h1", text: "Members"
  end

  test "creating a Member" do
    visit members_url
    click_on "New Member"

    fill_in "Address", with: @member.address
    fill_in "City", with: @member.city
    fill_in "Contact number", with: @member.contact_number
    fill_in "Country", with: @member.country
    fill_in "Date of birth", with: @member.date_of_birth
    fill_in "Email", with: @member.email
    fill_in "First name", with: @member.first_name
    fill_in "Gender", with: @member.gender
    fill_in "Last name", with: @member.last_name
    fill_in "State", with: @member.state
    fill_in "Zipcode", with: @member.zipcode
    click_on "Create Member"

    assert_text "Member was successfully created"
    click_on "Back"
  end

  test "updating a Member" do
    visit members_url
    click_on "Edit", match: :first

    fill_in "Address", with: @member.address
    fill_in "City", with: @member.city
    fill_in "Contact number", with: @member.contact_number
    fill_in "Country", with: @member.country
    fill_in "Date of birth", with: @member.date_of_birth
    fill_in "Email", with: @member.email
    fill_in "First name", with: @member.first_name
    fill_in "Gender", with: @member.gender
    fill_in "Last name", with: @member.last_name
    fill_in "State", with: @member.state
    fill_in "Zipcode", with: @member.zipcode
    click_on "Update Member"

    assert_text "Member was successfully updated"
    click_on "Back"
  end

  test "destroying a Member" do
    visit members_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Member was successfully destroyed"
  end
end
