# :title:PDate (Persian Date) #
class PDate

  def initialize *args

    if (args.size == 1) && (args.first.is_a?(Date))
      @year, @month, @day = Pconvertor.new.gregorian_to_persian(args.first.year, args.first.month, args.first.day)
    end
  end

  def to_s
    "#{@year}-#{@month}-#{@day}"
  end

end