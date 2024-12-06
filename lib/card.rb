
# The Card class represents a single flashcard.
# It has a question, an answer, and a category.
class Card
  # Provides read-only access to the card's attributes
  attr_reader :question, :answer, :category

  # Initializes a new Card with a question, answer, and category
  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end
end
