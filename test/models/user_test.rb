require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(fullname: "Example User", username: "foobar", email: "user@example.com", password: 'somesupersecurepassword')
  end

  test "should be valid" do
    assert @user.valid?
  end
end
