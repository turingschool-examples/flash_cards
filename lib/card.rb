#card class
#represent a single flashcard
#stores a question, answer, and category

class Card

  attr_reader :question, :answer, :category

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end
end
