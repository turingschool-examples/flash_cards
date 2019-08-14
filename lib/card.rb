class Card
  attr_reader :question, :answer, :category

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end

  def question
    question = @question
  p question
  end

  def answer
    answer = @answer
    p answer
  end

end


card1 = Card.new("What is the capital of Alaska", "Juneau", ":Geography")
card1.question
card1.answer
