class Card

  attr_reader :category, :question, :answer

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end
end
