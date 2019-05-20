require "application_system_test_case"

class AdminListsTest < ApplicationSystemTestCase
  setup do
    @admin_list = admin_lists(:one)
  end

  test "visiting the index" do
    visit admin_lists_url
    assert_selector "h1", text: "Admin Lists"
  end

  test "creating a Admin list" do
    visit admin_lists_url
    click_on "New Admin List"

    fill_in "Channel", with: @admin_list.channel_id
    fill_in "Name", with: @admin_list.name
    click_on "Create Admin list"

    assert_text "Admin list was successfully created"
    click_on "Back"
  end

  test "updating a Admin list" do
    visit admin_lists_url
    click_on "Edit", match: :first

    fill_in "Channel", with: @admin_list.channel_id
    fill_in "Name", with: @admin_list.name
    click_on "Update Admin list"

    assert_text "Admin list was successfully updated"
    click_on "Back"
  end

  test "destroying a Admin list" do
    visit admin_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Admin list was successfully destroyed"
  end
end
