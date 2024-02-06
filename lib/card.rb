# A card containing a question, answer, and cateogory
# Syntax:
# card = Card.new("question", "answer", :category)
class Card
  attr_reader :question, :answer, :category

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end
end
