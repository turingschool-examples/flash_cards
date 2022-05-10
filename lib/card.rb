# Creates an instance of Card with a question, answer, and a category
class Card
  # Initialize Card
  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end

  def question
    @question
  end

  def answer
    @answer
  end

  def category
    @category
  end
end
