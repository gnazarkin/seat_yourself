require 'test_helper'

class ReservationsControllerTest < ActionController::TestCase
  test "should get crate" do
    get :crate
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
