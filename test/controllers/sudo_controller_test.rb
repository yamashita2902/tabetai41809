require "test_helper"

class SudoControllerTest < ActionDispatch::IntegrationTest
  test "should get apt" do
    get sudo_apt_url
    assert_response :success
  end

  test "should get install" do
    get sudo_install_url
    assert_response :success
  end

  test "should get testdisk" do
    get sudo_testdisk_url
    assert_response :success
  end

  test "should get index" do
    get sudo_index_url
    assert_response :success
  end
end
