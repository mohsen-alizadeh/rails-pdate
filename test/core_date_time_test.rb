require 'test_helper'


class CoreDateTimeTest < ActiveSupport::TestCase

  test "to_pdate method return proper object" do
    assert_equal DateTime.now.to_pdatetime.class, PDateTime
    assert_equal Date.today.to_pdatetime.class, PDateTime
  end

  test "convert sample DateTime list" do
    {
        DateTime.new(1990, 1, 29, 8, 10, 2) => [1368, 11, 9, 8, 10, 2],
        DateTime.new(1990, 1, 29, 10, 10, 2) => [1368, 11, 9, 10, 10, 2],
        DateTime.new(1990, 1, 29, 8, 10, 5) => [1368, 11, 9, 8, 10, 5],
        DateTime.new(1990, 1, 29, 8, 3, 2) => [1368, 11, 9, 8, 3, 2],
    }.each do |datetime, pdatetime|
      assert_equal datetime.to_pdatetime.to_a, pdatetime
    end
  end
end
