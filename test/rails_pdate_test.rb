require 'test_helper'

class RailsPdateTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, RailsPdate
  end

  test "sample create persian date object from date 1" do
    assert_equal PDate.new(Date.new(1990, 1, 29)).to_s, "1368-11-9"
  end

  test "sample create persian date object from date 2" do
    assert_equal PDate.new(Date.new(1988, 11, 20)).to_s, "1367-8-29"
  end

  test "sample create persian date object from date 3" do
    assert_equal PDate.new(Date.new(2012, 11, 18)).to_s, "1391-8-28"
  end

  test "sample create persian date object from date 4" do
    assert_equal PDate.new(Date.new(2013, 4, 19)).to_s, "1392-1-30"
  end

end
