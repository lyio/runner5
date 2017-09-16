require 'test_helper'

class ShoesControllerTestNoAuth < ActionDispatch::IntegrationTest

  test "should require authentication" do
    get runs_url
    assert_redirected_to new_user_session_url
  end
end

class ShoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shoe = shoes(:one)

    user = users(:one)
    @shoe.user = user
    
    @shoe.save!
    sign_in user
  end

  test "should get index" do
    get shoes_url
    assert_response :success
  end

  test "should get new" do
    get new_shoe_url
    assert_response :success
  end

  test "should create shoe" do
    assert_difference('Shoe.count') do
      post shoes_url, params: { shoe: { bought_when: @shoe.bought_when, name: @shoe.name } }
    end

    assert_redirected_to shoe_url(Shoe.last)
  end

  test "should show shoe" do
    get shoe_url(@shoe)
    assert_response :success
  end

  test "should get edit" do
    get edit_shoe_url(@shoe)
    assert_response :success
  end

  test "should update shoe" do
    @shoe.save!
    patch shoe_url(@shoe), params: { shoe: { bought_when: Date.today, name: @shoe.name } }
    assert_redirected_to shoe_url(@shoe)
  end

  test "should destroy shoe" do
    assert_difference('Shoe.count', -1) do
      delete shoe_url(@shoe)
    end

    assert_redirected_to shoes_url
  end
end
