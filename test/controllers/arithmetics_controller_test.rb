require 'test_helper'

class ArithmeticsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get arithmetics_new_url
    assert_response :success
  end

end
