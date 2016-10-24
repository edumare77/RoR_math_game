require 'test_helper'

class ArithmeticsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get game_path
    assert_response :success
  end

end
