class Card
  attr_reader :question, :answer, :category

  def initialize(question_parameter, answer_parameter, category_parameter)
    @question = question_parameter
    @answer = answer_parameter
    @category = category_parameter
  end

end

#card = Card.new("What is the capital of Alaska?", "Juneau", "Geography")
#p card.question
#p card.answer
#p card.category
