class Card
  attr_reader :category, :answer, :question

  def initialize(question, answer, category)
    @category = category
    @answer = answer
    @question = question
  end
end
