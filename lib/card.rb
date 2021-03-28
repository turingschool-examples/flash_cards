class Card
  attr_reader :question, :category, :answer
  def initialize(question, answer, category)
    @question = question
    @category = category
    @answer = answer
  end
end
