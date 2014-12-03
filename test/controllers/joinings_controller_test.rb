require 'test_helper'

class JoiningsControllerTest < ActionController::TestCase
  test "should get accept" do
    get :accept
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
