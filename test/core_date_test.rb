require 'test_helper'


class CoreDateTest < ActiveSupport::TestCase

  test "date to pdate" do
    assert_equal Date.today.to_pdate.class, PDate
  end
end
