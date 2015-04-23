require 'test_helper'

#Details on how to write these are covered at http://guides.rubyonrails.org/testing.html#integration-testing
class RegisterTest < ActionDispatch::IntegrationTest
  
  test "Register Renter" do
    get "/users/sign_up"
    
    assert_difference("Renter.count", 1) do 
      assert_difference("User.count", 1) do
        post "/users", {user: {name: "Test Renter", type: "Renter", email: "test2@example.com", password: "password1"}}
        assert_response :redirect
        assert_redirected_to "/"
      end
    end
  end
  
end