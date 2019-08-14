# Class for creating a card
class Card
  attr_reader :question, :answer, :category

  # Give the card a question, an answer, and a category
  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end
end
