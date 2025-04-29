require "test_helper"

class DeihesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get deihes_index_url
    assert_response :success
  end
end
