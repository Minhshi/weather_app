require "application_system_test_case"

class CitiesTest < ApplicationSystemTestCase

  #read
  test "visiting the index" do
    visit cities_path
    # save_and_open_screenshot
    assert_selector "h1", text: "City"
  end

  #create
  test "add a city" do
    login_as users(:minh)
    visit new_city_path
    # save_and_open_screenshot
    fill_in "city_name", with: "Mexico City"
    # save_and_open_screenshot
    click_on "Create City"
    # save_and_open_screenshot
    assert_equal cities_path, page.current_path
    assert_text "Mexico City"
    # save_and_open_screenshot
  end

  #update
  test "update city name" do
    login_as users(:minh)
    visit edit_city_path(1)
    # save_and_open_screenshot
    fill_in "city_name", with: "Berlin, DE"
    # save_and_open_screenshot
    click_on "Update City"
    # save_and_open_screenshot
    assert_equal city_path(1), page.current_path
    assert_text "Berlin, DE"
    # save_and_open_screenshot
  end

  #destroy
  test "delete a city" do
    login_as users(:minh)
    visit city_path(2)
    # save_and_open_screenshot
    click_link "Delete"
    # save_and_open_screenshot
    assert_equal cities_path, page.current_path
    # save_and_open_screenshot
  end

end
