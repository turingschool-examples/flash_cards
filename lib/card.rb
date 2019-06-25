class Card
  attr_accessor :question, :answer, :category

  def initialize(q, a, c)
    @question = q
    @answer = a
    @category = c
  end
end
