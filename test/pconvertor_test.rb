require 'test_helper'


class PconvertorTest < ActiveSupport::TestCase

  test "sample gregorian to persian date 1" do
    assert_equal Pconvertor.new.gregorian_to_persian(1990, 1, 29), [1368, 11, 9]
  end


  test "sample gregorian to persian date 2" do
    assert_equal Pconvertor.new.gregorian_to_persian(1988, 11, 20), [1367, 8, 29]
  end


  test "sample gregorian to persian date 3" do
    assert_equal Pconvertor.new.gregorian_to_persian(2012, 11, 18), [1391, 8, 28]
  end

  test "sample gregorian to persian date 4" do
    assert_equal Pconvertor.new.gregorian_to_persian(2013, 4, 19), [1392, 1, 30]
  end

  test "sample persian to gregorian date 1" do
    assert_equal Pconvertor.new.persian_to_gregorian(1368, 11, 9), [1990, 1, 29]
  end


  test "sample persian to gregorian date 2" do
    assert_equal Pconvertor.new.persian_to_gregorian(1367, 8, 29), [1988, 11, 20]
  end


  test "sample persian to gregorian date 3" do
    assert_equal Pconvertor.new.persian_to_gregorian(1391, 8, 28), [2012, 11, 18]
  end

  test "sample persian to gregorian date 4" do
    assert_equal Pconvertor.new.persian_to_gregorian(1392, 1, 30), [2013, 4, 19]
  end

end
