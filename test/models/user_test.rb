require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(fullname: "Example User", username: "foobar", email: "user@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "should be invalid without username" do
    @user.username = nil
    assert !@user.valid?
  end

  test "should be invalid without email" do
    @user.email = nil
    assert !@user.valid?
  end

  test "should be invalid without full name" do
    @user.fullname = nil
    assert !@user.valid?
  end

  test "format_email_username strips whitespace and downcases" do
    @user = User.new(fullname: "Example User", username: "foo Bar", email: "  User@example.com")

    @user.format_email_username

    assert @user.username == "foobar"
    assert @user.email == "user@example.com"
  end

  test "generate_token creates a token and saves creation time" do
    assert_nil @user.login_token
    
    @user.generate_login_token

    assert_not_nil @user.login_token
    assert_not_nil @user.token_generated_at
  end

  test "generated token is valid" do
    @user.generate_login_token

    assert @user.valid_token?(@user.login_token)
  end

  test "valid_token? returns false for no token" do
    @user.generate_login_token
    @user.login_token = nil

    assert_nil @user.valid_token?(@user.login_token)
  end

  test "expire_token! removes token" do
    @user.generate_login_token
    token = @user.login_token
    assert @user.valid_token?(token)

    @user.expire_token!
    assert !@user.valid_token?(token)
  end

  test "generated token expires after 2h" do
    @user.token_generated_at = 3.hours.ago

    assert @user.login_token_expired?
  end
end
