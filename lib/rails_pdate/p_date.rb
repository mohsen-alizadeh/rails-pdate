# encoding: utf-8

# :title:PDate (Persian Date) #
class PDate

  attr_accessor :year, :month, :day, :hour, :min, :sec

  DATE_FORMATS = {
      :short        => '%e %b',
      :long         => '%B %e, %Y',
      :db           => '%Y-%m-%d',
      :number       => '%Y%m%d',
      :long_ordinal => lambda { |date|
        day_format = ActiveSupport::Inflector.ordinalize(date.day)
        date.strftime("%B #{day_format}, %Y") # => "April 25th, 2007"
      },
      :rfc822       => '%e %b %Y',
      :iso8601      => lambda { |date| date.iso8601 },
      :default      => '%Y-%m-%d'
  }

  def initialize *args

    if (args.size == 1) && (args.first.is_a?(Date))
      year, month, day = Pconvertor.new.gregorian_to_persian(args.first.year, args.first.month, args.first.day)
    else
      year,month,day,hour,min,sec,zone,utc_offset = args
    end

    @year = year
    @month = month
    @day = day
    @hour ||= hour || 0
    @min ||= min || 0
    @sec ||= sec || 0
    @zone ||= zone || "UTC"
    @utc_offset ||= utc_offset || 0
  end

  def to_date
    year, month, day = Pconvertor.new.persian_to_gregorian(@year, @month, @day)
    Date.new(year, month, day)
  end


  def to_formatted_s(format = :default)
    if formatter = DATE_FORMATS[format]
      if formatter.respond_to?(:call)
        formatter.call(self).to_s
      else
        strftime(formatter)
      end
    else
      to_default_s
    end
  end

  alias_method :to_default_s, :to_s
  alias_method :to_s, :to_formatted_s

  # Overrides the default inspect method with a human readable one, e.g., "Mon, 21 Feb 2005"
  def readable_inspect
    strftime('%a, %d %b %Y')
  end
  alias_method :default_inspect, :inspect
  alias_method :inspect, :readable_inspect

  def to_formatted_s
    strftime(DATE_FORMATS[:default])
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
  end

  def ==(other)
    return true if to_s == other.to_s
    false
  end

  def clone
    PDate.new(@year, @month, @day)
  end

  def to_a
    [@year, @month, @day]
  end

  def inspect
    to_s
  end



  # day of calendar week (1-7, Shanbe is 1).
  def cwday
    cwday = to_date.cwday + 2
    cwday -= 7 if cwday > 7
    cwday
  end

  # get day of year ( 1 - 365 )
  def yday
    day_of_year = 0

    (1..(@month-1)).to_a.each do |month|
      day_of_year += PDaysInMonth[month-1]
    end

    day_of_year += day

    day_of_year
  end

  def pdayname
    PERSIAN_WEEKDAY_NAMES[self.cwday-1]
  end

  def +(other)
    ( to_date + other ).to_pdate
  end

  def -(other)
    ( to_date - other ).to_pdate
  end
end
