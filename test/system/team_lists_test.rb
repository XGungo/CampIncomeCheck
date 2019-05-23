require "application_system_test_case"

class TeamListsTest < ApplicationSystemTestCase
  setup do
    @team_list = team_lists(:one)
  end

  test "visiting the index" do
    visit team_lists_url
    assert_selector "h1", text: "Team Lists"
  end

  test "creating a Team list" do
    visit team_lists_url
    click_on "New Team List"

    fill_in "Channel", with: @team_list.channel_id
    fill_in "Team", with: @team_list.team_id
    fill_in "Team name", with: @team_list.team_name
    fill_in "Total score", with: @team_list.total_score
    click_on "Create Team list"

    assert_text "Team list was successfully created"
    click_on "Back"
  end

  test "updating a Team list" do
    visit team_lists_url
    click_on "Edit", match: :first

    fill_in "Channel", with: @team_list.channel_id
    fill_in "Team", with: @team_list.team_id
    fill_in "Team name", with: @team_list.team_name
    fill_in "Total score", with: @team_list.total_score
    click_on "Update Team list"

    assert_text "Team list was successfully updated"
    click_on "Back"
  end

  test "destroying a Team list" do
    visit team_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Team list was successfully destroyed"
  end
end
