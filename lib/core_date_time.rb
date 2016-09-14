
DateTime.class_eval do
  def to_pdate
    PDate.new(self)
  end

  def to_pdatetime
    PDateTime.new(self)
  end
end
