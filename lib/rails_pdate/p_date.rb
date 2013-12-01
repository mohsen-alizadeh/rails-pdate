require 'date'

# :title:PDate (Persian Date) #
class PDate

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

  # Converts a Date instance to a Time, where the time is set to the beginning of the day.
  # The timezone can be either :local or :utc (default :local).
  #
  #   date = Date.new(2007, 11, 10)  # => Sat, 10 Nov 2007
  #
  #   date.to_time                   # => Sat Nov 10 00:00:00 0800 2007
  #   date.to_time(:local)           # => Sat Nov 10 00:00:00 0800 2007
  #
  #   date.to_time(:utc)             # => Sat Nov 10 00:00:00 UTC 2007
  def to_time(form = :local)
    ::Time.send(form, year, month, day)
  end

  def xmlschema
    in_time_zone.xmlschema
  end

  def strftime(format)
    format
      .gsub('%Y', '%d' % @year)
      .gsub('%m', '%02d' % @month)
      .gsub('%d', '%02d' % @day)
      .gsub('%C', '%d' % (@year / 100) )
  end
end