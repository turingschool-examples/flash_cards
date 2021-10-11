class Card
  attr_accessor :question, :answer, :category

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end
end

card_1 = Card.new("What is the capital of Alaska?", "Jueau", "Geography")
puts card_1
