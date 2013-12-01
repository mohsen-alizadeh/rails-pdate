require 'test_helper'

class RailsPdateTest < ActiveSupport::TestCase

  test "truth" do
    assert_kind_of Module, RailsPdate
  end

  # creating PDate from Date
  test "sample create persian date object from date 1" do
    assert_equal PDate.new(Date.new(1990, 1, 29)).to_s, "1368-11-09"
  end

  test "sample create persian date object from date 2" do
    assert_equal PDate.new(Date.new(1988, 11, 20)).to_s, "1367-08-29"
  end

  test "sample create persian date object from date 3" do
    assert_equal PDate.new(Date.new(2012, 11, 18)).to_s, "1391-08-28"
  end

  test "sample create persian date object from date 4" do
    assert_equal PDate.new(Date.new(2013, 4, 19)).to_s, "1392-01-30"
  end

  # creating Date from PDate
  test "sample create date object from persian date 1" do
    assert_equal PDate.new(1368, 11, 9).to_date.to_s, "1990-01-29"
  end

  test "sample create date object from persian date 2" do
    assert_equal PDate.new(1367, 8, 29).to_date.to_s, "1988-11-20"
  end

  test "sample create date object from persian date 3" do
    assert_equal PDate.new(1391, 8, 28).to_date.to_s, "2012-11-18"
  end

  test "sample create date object from persian date 4" do
    assert_equal PDate.new(1392, 1, 30).to_date.to_s, "2013-04-19"
  end

  test "strftime format %C" do
    assert_equal PDate.new(1392, 1, 30).strftime("%C"), "13"
  end

  test "strftime format %y" do
    assert_equal PDate.new(1392, 1, 30).strftime("%y"), "92"
  end

  test "strftime format %B" do
    assert_equal PDate.new(1392, 1, 30).strftime("%B"), "Farvardin"
  end
end
