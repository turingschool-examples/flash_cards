# Card class declaration
class Card
  # Class attribute declaration.
  attr_accessor :question, :answer, :category

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end
end