require "test_helper"

class RequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get requests_index_url
    assert_response :success
  end

  test "should get show" do
    get requests_show_url
    assert_response :success
  end

  test "should get listing" do
    get requests_listing_url
    assert_response :success
  end
end
