module RailsPdate
  class BaseDateTime

    attr_accessor :year, :month, :day

    include RailsPdate::Constants
    include RailsPdate::TimeShifting

    def initialize *args

      @year = @month = @day = @hour = @minute = @second = 0

      if (args.size == 1)
        @year, @month, @day = Pconvertor.new.gregorian_to_persian(args.first.year, args.first.month, args.first.day)

        if (args.first.is_a?(DateTime))
          @hour = args.first.hour
          @minute = args.first.minute
          @second = args.first.second
        end
      else
        @year, @month, @day, @hour, @minute, @second = args
      end
    end

    def ==(other)
      return true if to_s == other.to_s
      false
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

    def cweek
      (yday / 7) + (@day % 7 == 0 ? 0 : 1)
    end

    def pdayname
      PERSIAN_WEEKDAY_NAMES[self.cwday-1]
    end

    def to_date
      year, month, day = Pconvertor.new.persian_to_gregorian(@year, @month, @day)
      Date.new(year, month, day)
    end


    def <=(other)
      self.to_i <= other.to_i
    end

    def <(other)
      self.to_i < other.to_i
    end

    def >=(other)
      self.to_i >= other.to_i
    end

    def >(other)
      self.to_i > other.to_i
    end

    def ==(other)
      self.to_i == other.to_i
    end

    def to_i
      to_datetime.to_i
    end



    # Overrides the default inspect method with a human readable one, e.g., "Mon, 21 Feb 2005"
    alias_method :default_inspect, :inspect
  end
end
