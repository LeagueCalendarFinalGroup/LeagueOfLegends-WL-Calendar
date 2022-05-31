require "test_helper"

class WlCalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wl_cal = wl_cals(:one)
  end

  test "should get index" do
    get wl_cals_url
    assert_response :success
  end

  test "should get new" do
    get new_wl_cal_url
    assert_response :success
  end

  test "should create wl_cal" do
    assert_difference("WlCal.count") do
      post wl_cals_url, params: { wl_cal: {  } }
    end

    assert_redirected_to wl_cal_url(WlCal.last)
  end

  test "should show wl_cal" do
    get wl_cal_url(@wl_cal)
    assert_response :success
  end

  test "should get edit" do
    get edit_wl_cal_url(@wl_cal)
    assert_response :success
  end

  test "should update wl_cal" do
    patch wl_cal_url(@wl_cal), params: { wl_cal: {  } }
    assert_redirected_to wl_cal_url(@wl_cal)
  end

  test "should destroy wl_cal" do
    assert_difference("WlCal.count", -1) do
      delete wl_cal_url(@wl_cal)
    end

    assert_redirected_to wl_cals_url
  end
end
