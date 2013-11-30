
Date.class_eval do
  def to_pdate
    PDate.new(self)
  end
end