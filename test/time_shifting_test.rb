require 'test_helper'


class TimeShiftingTest < ActiveSupport::TestCase

  test "time shifting" do
    assert_equal "1368/11/09".to_pdate.beginning_of_year.to_a, [1368, 1, 1]
    assert_equal "1368/11/09".to_pdate.beginning_of_month.to_a, [1368, 11, 1]
    assert_equal "1394/05/11".to_pdate.beginning_of_week.to_a, [1394, 5, 10]
    assert_equal "1394/02/02".to_pdate.beginning_of_week.to_a, [1394, 1, 29]
    assert_equal "1393/01/01".to_pdate.beginning_of_week.to_a, [1392, 12, 24]

    assert_equal "1368/11/09".to_pdate.end_of_year.to_a, [1368, 12, 29]
    assert_equal "1368/11/09".to_pdate.end_of_month.to_a, [1368, 11, 30]
    assert_equal "1394/05/11".to_pdate.end_of_week.to_a, [1394, 5, 16]
  end
end
