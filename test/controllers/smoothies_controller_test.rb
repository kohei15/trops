require 'test_helper'

class SmoothiesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get smoothies_top_url
    assert_response :success
  end

  test "should get index" do
    get smoothies_index_url
    assert_response :success
  end

  test "should get show" do
    get smoothies_show_url
    assert_response :success
  end

  test "should get edit" do
    get smoothies_edit_url
    assert_response :success
  end

  test "should get update" do
    get smoothies_update_url
    assert_response :success
  end

  test "should get new" do
    get smoothies_new_url
    assert_response :success
  end

  test "should get create" do
    get smoothies_create_url
    assert_response :success
  end

  test "should get destroy" do
    get smoothies_destroy_url
    assert_response :success
  end

end
