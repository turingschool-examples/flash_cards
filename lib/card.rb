class Card
  attr_reader

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end
end
