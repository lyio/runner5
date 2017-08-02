require 'test_helper'

class RunTypesControllerTestNoAuth < ActionDispatch::IntegrationTest

  test "should require authentication" do
    get run_types_url
    assert_redirected_to new_user_session_url
  end
end

class RunTypesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @run_type = run_types(:one)
    user = users(:one)

    sign_in user
  end

  test "should get index" do
    get run_types_url
    assert_response :success
  end

  test "should get new" do
    get new_run_type_url
    assert_response :success
  end

  test "should create run_type" do
    assert_difference('RunType.count') do
      post run_types_url, params: { run_type: { name: "@runtype.name", heartrate: 0.6 } }
    end

    assert_redirected_to run_types_url
  end

  test "should get edit" do
    get edit_run_type_url(@run_type)
    assert_response :success
  end

  test "should update run_type" do
    patch run_type_url(@run_type), params: { run_type: { name: "@run.name", heartrate: 0.8 }}
    assert_redirected_to run_types_url
  end
end
