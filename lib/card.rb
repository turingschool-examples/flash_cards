class Card
  attr_accessor :category, :answer, :question

  def initialize(question, answer, category)
    @question = question.to_s
    @answer = answer.to_i
    @category = category
  end
end

card_1 = Card.new("What is the sum of 5 + 5?", 10, Math)

p card_1 
