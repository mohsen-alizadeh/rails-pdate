# encoding: utf-8

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

  test "strftime format %b" do
    assert_equal PDate.new(1392, 1, 30).strftime("%b"), "فروردین"
  end

  test "strftime format %e" do
    assert_equal PDate.new(1368, 11, 9).strftime("%e"), "9"
  end

  test "strftime format %A" do
    assert_equal PDate.new(1394, 1, 1).strftime("%A"), "شنبه"
  end

  test "to_formatted_s method" do
    assert_equal PDate.new(1368, 11, 9).to_s, "1368-11-09"
  end

  test "comparison two similar pdate" do
    assert_equal PDate.new(1368, 11, 9), PDate.new(1368, 11, 9)
  end

  test "comparison two unsimilar pdate" do
    assert_not_equal PDate.new(1368, 10, 9), PDate.new(1368, 11, 9)
  end

  test "comparison pdate with it`s cloned instance" do
    date = PDate.new(1368, 11, 9)
    assert_equal date, date.clone
  end

  test "check object id of cloned instance" do
    date = PDate.new(1368, 11, 9)
    assert_not_equal date.object_id, date.clone.object_id
  end

  test "check to_a method" do
    assert_equal PDate.new(1368, 11, 9).to_a, [1368, 11, 9]
  end

  test "inspect method of PDate" do
    assert_equal PDate.new(1368, 11, 9).inspect, "1368-11-09"
  end

  test "get day of year" do
    assert_equal PDate.new(1394, 1, 1).yday, 1
    assert_equal PDate.new(1394, 2, 1).yday, 32
    assert_equal PDate.new(1377, 3, 4).yday, 66
    assert_equal PDate.new(1368, 11, 9).yday, 315
  end

  test "get cwday" do
    assert_equal PDate.new(1394, 1, 1).cwday, 1
    assert_equal PDate.new(1394, 1, 2).cwday, 2
    assert_equal PDate.new(1394, 1, 3).cwday, 3
    assert_equal PDate.new(1394, 1, 4).cwday, 4
    assert_equal PDate.new(1394, 1, 5).cwday, 5
    assert_equal PDate.new(1394, 1, 6).cwday, 6
    assert_equal PDate.new(1394, 1, 7).cwday, 7
  end

  test "get cweek" do
    assert_equal PDate.new(1394, 1, 1).cweek, 1
    assert_equal PDate.new(1394, 1, 7).cweek, 1
    assert_equal PDate.new(1394, 1, 8).cweek, 2
    assert_equal PDate.new(1394, 2, 1).cweek, 5
    assert_equal PDate.new(1394, 12, 29).cweek, 53
  end
end
