require 'test_helper'

class AdminListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_list = admin_lists(:one)
  end

  test "should get index" do
    get admin_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_list_url
    assert_response :success
  end

  test "should create admin_list" do
    assert_difference('AdminList.count') do
      post admin_lists_url, params: { admin_list: { channel_id: @admin_list.channel_id, name: @admin_list.name } }
    end

    assert_redirected_to admin_list_url(AdminList.last)
  end

  test "should show admin_list" do
    get admin_list_url(@admin_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_list_url(@admin_list)
    assert_response :success
  end

  test "should update admin_list" do
    patch admin_list_url(@admin_list), params: { admin_list: { channel_id: @admin_list.channel_id, name: @admin_list.name } }
    assert_redirected_to admin_list_url(@admin_list)
  end

  test "should destroy admin_list" do
    assert_difference('AdminList.count', -1) do
      delete admin_list_url(@admin_list)
    end

    assert_redirected_to admin_lists_url
  end
end
