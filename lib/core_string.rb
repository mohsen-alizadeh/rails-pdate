String.class_eval do
  def to_pdate

    result = self.match(/(\d{2,4})(\/|-)(\d{1,2})(\/|-)(\d{1,2})/)
    return if result.nil?

      year, _sp, week, _sp, day = result.captures

      if year.to_i < 100
        year = 1300 + year.to_i
      end

      return PDate.new(year.to_i, week.to_i, day.to_i)
  end
end
