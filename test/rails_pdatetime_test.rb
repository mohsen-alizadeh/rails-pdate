# encoding: utf-8

require 'test_helper'

class RailsPdatetimeTest < ActiveSupport::TestCase

  test "sample create persian date time object from samples" do

    {
      PDateTime.new(1368, 11, 9, 8, 10, 0).to_s => '1368-11-09 08:10'
    }.each do |pdatetime, datetime|
      assert_equal pdatetime, datetime
    end
  end
end
