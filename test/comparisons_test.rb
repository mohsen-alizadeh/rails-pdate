require 'test_helper'


class CoreDateTest < ActiveSupport::TestCase

  test "two same dates comparison" do
    assert_equal PDate.new(1368, 11, 9), PDate.new(1368, 11, 9)
  end

  test "compare not equal dates" do
    assert_operator PDate.new(1368, 11, 11), :>, PDate.new(1368, 11, 10)

    assert_operator PDate.new(1368, 11, 11), :>=, PDate.new(1368, 11, 10)
    assert_operator PDate.new(1368, 11, 10), :>=, PDate.new(1368, 11, 10)

    assert_operator PDate.new(1368, 11, 9), :<, PDate.new(1368, 11, 10)

    assert_operator PDate.new(1368, 11, 9), :<=, PDate.new(1368, 11, 10)
    assert_operator PDate.new(1368, 11, 10), :<=, PDate.new(1368, 11, 10)
  end

  test "two same datetimes comparison" do
    assert_equal PDateTime.new(1368, 11, 9, 8, 10, 0), PDateTime.new(1368, 11, 9, 8, 10, 0)
  end

  test "compare not equal datetimes" do
    assert_operator PDateTime.new(1368, 11, 9, 8, 10, 5), :>, PDateTime.new(1368, 11, 9, 8, 10, 0)
    assert_operator PDateTime.new(1368, 11, 9, 8, 10, 5), :>=, PDateTime.new(1368, 11, 9, 8, 10, 0)
    assert_operator PDateTime.new(1368, 11, 9, 8, 10, 0), :>=, PDateTime.new(1368, 11, 9, 8, 10, 0)
    assert_operator PDateTime.new(1368, 11, 9, 8, 9, 5), :<, PDateTime.new(1368, 11, 9, 8, 10, 0)
    assert_operator PDateTime.new(1368, 11, 9, 8, 10, 0), :<=, PDateTime.new(1368, 11, 9, 8, 10, 0)
  end

end
