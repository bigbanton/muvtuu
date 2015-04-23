class IntegrationTestBase < ActionDispatch::IntegrationTest
  
  def login(user)
    open_session do |sess|
      u = users(user)
      sess.https!

      sess.post_via_redirect "/users/sign_in", "user[email]" => u.email, "user[password]" => 'samplepassword123'
      assert_equal "/site", sess.path
      assert_equal "Signed in successfully.", sess.flash[:notice]

      https!(false)
    end

end