require 'test_helper'

class TeamListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team_list = team_lists(:one)
  end

  test "should get index" do
    get team_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_team_list_url
    assert_response :success
  end

  test "should create team_list" do
    assert_difference('TeamList.count') do
      post team_lists_url, params: { team_list: { score: @team_list.score, team_id: @team_list.team_id, team_name: @team_list.team_name } }
    end

    assert_redirected_to team_list_url(TeamList.last)
  end

  test "should show team_list" do
    get team_list_url(@team_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_team_list_url(@team_list)
    assert_response :success
  end

  test "should update team_list" do
    patch team_list_url(@team_list), params: { team_list: { score: @team_list.score, team_id: @team_list.team_id, team_name: @team_list.team_name } }
    assert_redirected_to team_list_url(@team_list)
  end

  test "should destroy team_list" do
    assert_difference('TeamList.count', -1) do
      delete team_list_url(@team_list)
    end

    assert_redirected_to team_lists_url
  end
end
