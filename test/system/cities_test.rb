require "application_system_test_case"

class CitiesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit cities_path
    save_and_open_screenshot
    assert_selector "h1", text: "City"
  end
end
