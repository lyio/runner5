require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @session = sessions(:one)

    user.generate_login_token
    get "/auth/#{user.id}/#{user.login_token}"
  end
end
