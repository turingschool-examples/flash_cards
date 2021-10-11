class Card
  attr_accessor :question, :answer, :category

  def initialize(q = nil, a = nil, c = nil)
    @question = q
    @answer = a
    @category = c.to_sym
  end

end
