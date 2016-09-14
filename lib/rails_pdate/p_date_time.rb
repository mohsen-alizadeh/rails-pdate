# encoding: utf-8

# :title:PDateTime (Persian DateTime) #
class PDateTime < RailsPdate::BaseDateTime

  attr_accessor :hour, :minute, :second

  include RailsPdate::Formats::DateTime

  def to_a
    [@year, @month, @day, @hour, @minute, @second]
  end

  def strftime(format)
    format
        .gsub('%Y', '%d' % @year)
        .gsub('%m', '%02d' % @month)
        .gsub('%d', '%02d' % @day)
        .gsub('%C', '%d' % (@year / 100) )
        .gsub('%y', '%d' % (@year % 100) )
        .gsub('%B', '%s' %  PERSIAN_MONTH_NAMES_PINGLISH[@month])
        .gsub('%b', '%s' %  PERSIAN_MONTH_NAMES[@month])
        .gsub('%e', '%d' % @day)
        .gsub('%A', '%s' % PERSIAN_WEEKDAY_NAMES[self.cwday-1])
        .gsub('%H', '%d' % @hour)
        .gsub('%h', '%02d' % @hour)
        .gsub('%i', '%02d' % @minute)
        .gsub('%I', '%d' % @minute)
        .gsub('%s', '%02d' % @second)
        .gsub('%S', '%d' % @second)
  end

  def clone
    PDateTime.new(@year, @month, @day, @hour, @minute, @second)
  end

  def to_datetime
    year, month, day = Pconvertor.new.persian_to_gregorian(@year, @month, @day)
    DateTime.new(year, month, day, @hour, @minute, @second)
  end

  def +(other)
    ( to_datetime + other ).to_pdatetime
  end

  def -(other)
    ( to_datetime - other ).to_pdatetime
  end
end
