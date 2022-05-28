require "application_system_test_case"

class WlCalsTest < ApplicationSystemTestCase
  setup do
    @wl_cal = wl_cals(:one)
  end

  test "visiting the index" do
    visit wl_cals_url
    assert_selector "h1", text: "Wl cals"
  end

  test "should create wl cal" do
    visit wl_cals_url
    click_on "New wl cal"

    click_on "Create Wl cal"

    assert_text "Wl cal was successfully created"
    click_on "Back"
  end

  test "should update Wl cal" do
    visit wl_cal_url(@wl_cal)
    click_on "Edit this wl cal", match: :first

    click_on "Update Wl cal"

    assert_text "Wl cal was successfully updated"
    click_on "Back"
  end

  test "should destroy Wl cal" do
    visit wl_cal_url(@wl_cal)
    click_on "Destroy this wl cal", match: :first

    assert_text "Wl cal was successfully destroyed"
  end
end
