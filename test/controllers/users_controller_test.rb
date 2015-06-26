require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @user = users(:example_user)
  end

  test "should get show" do
    get :show, id:@user
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, id:@user
    assert_response :success
  end

end
