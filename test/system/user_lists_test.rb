require "application_system_test_case"

class UserListsTest < ApplicationSystemTestCase
  setup do
    @user_list = user_lists(:one)
  end

  test "visiting the index" do
    visit user_lists_url
    assert_selector "h1", text: "User Lists"
  end

  test "creating a User list" do
    visit user_lists_url
    click_on "New User List"

    fill_in "Channel", with: @user_list.channel_id
    fill_in "Dual score", with: @user_list.dual_score
    fill_in "Name", with: @user_list.name
    click_on "Create User list"

    assert_text "User list was successfully created"
    click_on "Back"
  end

  test "updating a User list" do
    visit user_lists_url
    click_on "Edit", match: :first

    fill_in "Channel", with: @user_list.channel_id
    fill_in "Dual score", with: @user_list.dual_score
    fill_in "Name", with: @user_list.name
    click_on "Update User list"

    assert_text "User list was successfully updated"
    click_on "Back"
  end

  test "destroying a User list" do
    visit user_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User list was successfully destroyed"
  end
end
