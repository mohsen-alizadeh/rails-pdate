module RailsPdate
  module TimeShifting

    def self.included( other )
      other.extend( RailsPdate::Constants )
    end

    def beginning_of_year
      beginning_of_month
      @month = 1
      self
    end

    def beginning_of_month
      beginning_of_day
      @day = 1
      self
    end

    def beginning_of_week
      beginning_of_day
      self - ( cwday - 1)
    end

    def beginning_of_day
      beginning_of_hour
      @hour = 0
      self
    end

    def beginning_of_hour
      beginning_of_minute
      @min = 0
      self
    end

    def beginning_of_minute
      @sec = 0
      self
    end

    def end_of_year
      @month = 12
      end_of_month
      self
    end

    def end_of_month
      end_of_day
      @day = RailsPdate::Constants::PDaysInMonth[@month-1]
      self
    end

    def end_of_week
      end_of_day
      self + ( 7 - cwday )
    end

    def end_of_day
      end_of_hour
      @hour = 23
      self
    end

    def end_of_hour
      end_of_minute
      @minute = 59
      self
    end

    def end_of_minute
      @sec = 59
      self
    end
  end
end
