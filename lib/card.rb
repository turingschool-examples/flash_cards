class Card
  attr_accessor :question, :answer, :category

  def initialize(q = nil, a = nil, c = nil) # Default values for parameters are null
    @question = q
    @answer = a
    @category = c.to_sym # Make sure our category variable is a symbol
  end

end
