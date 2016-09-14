# encoding: utf-8

# :title:PDate (Persian Date) #
class PDate < RailsPdate::BaseDateTime

  include RailsPdate::Formats::Date

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
  end

  def clone
    PDate.new(@year, @month, @day)
  end

  def to_a
    [@year, @month, @day]
  end

  def +(other)
    ( to_date + other ).to_pdate
  end

  def -(other)
    ( to_date - other ).to_pdate
  end

  def to_datetime
    to_date.to_datetime
  end

  alias_method :inspect, :to_s
end
