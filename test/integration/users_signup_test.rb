require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "valid signup information" do
    get '/users/new'
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { name:  "Example User",
                                            email: "user@example.com",
                                            hashed_password:              "password",
                                            user_name: "exampl_user" }
    end
    assert_template 'main_layout'
  end
end