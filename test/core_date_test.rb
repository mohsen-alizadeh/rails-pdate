require 'test_helper'


class CoreDateTest < ActiveSupport::TestCase

  test "date to pdate" do
    assert_equal Date.today.to_pdate.class, PDate
    assert_equal DateTime.now.to_pdate.class, PDate
  end

  test "date to pdate 1" do
    assert_equal Date.new(1990, 1, 29).to_pdate.to_a, [1368, 11, 9]
  end

  test "date to pdate 2" do
    assert_equal Date.new(1988, 11, 20).to_pdate.to_a, [1367, 8, 29]
  end
end
