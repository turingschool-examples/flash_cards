class Card
  attr_reader :question, :answer, :category

  def initialize(q, a, c)
    @question = q
    @answer = a
    @category = c
  end
end
