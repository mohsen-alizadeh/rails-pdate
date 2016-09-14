require 'test_helper'


class CoreDateTest < ActiveSupport::TestCase

  test "parse string to pdate with format: %Y-%m-%d 1" do
    assert_equal "1368-11-09".to_pdate.to_a, [1368, 11, 9]
  end

  test "parse string to pdate with format: %Y-%m-%d 3" do
    assert_equal "1368/11/09".to_pdate.to_a, [1368, 11, 9]
  end

  test "parse string to pdate with format: %Y-%m-%d 2" do
    assert_equal "1367-08-29".to_pdate.to_a, [1367, 8, 29]
  end
end
