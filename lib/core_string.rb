String.class_eval do
  def to_pdate

    date = Date._parse(self)
    return PDate.new(date[:year], date[:mon], date[:mday])
  end
end