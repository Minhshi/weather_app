require 'test_helper'

class CityTest < ActiveSupport::TestCase

  test "should not save if name is not present" do
    city = City.new
    assert_not city.save
  end

  test "should not save if name is not unique" do
    city = City.create(name: "Berlin")
    assert_not city.save
  end

end
