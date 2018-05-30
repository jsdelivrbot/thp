require 'test_helper'

class MousaillardsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get mousaillards_new_url
    assert_response :success
  end

  test "should get create" do
    get mousaillards_create_url
    assert_response :success
  end

  test "should get edit" do
    get mousaillards_edit_url
    assert_response :success
  end

  test "should get update" do
    get mousaillards_update_url
    assert_response :success
  end

  test "should get index" do
    get mousaillards_index_url
    assert_response :success
  end

  test "should get show" do
    get mousaillards_show_url
    assert_response :success
  end

end
