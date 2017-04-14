require 'test_helper'

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "root path should get home" do
    get root_path 
    assert_response :success
  end

end
