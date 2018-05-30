require 'test_helper'

class CorsairesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get corsaires_index_url
    assert_response :success
  end

  test "should get new" do
    get corsaires_new_url
    assert_response :success
  end

  test "should get create" do
    get corsaires_create_url
    assert_response :success
  end

  test "should get edit" do
    get corsaires_edit_url
    assert_response :success
  end

  test "should get update" do
    get corsaires_update_url
    assert_response :success
  end

end
