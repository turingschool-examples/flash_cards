class Card
  attr_reader :question,
              :answer,
              :category
  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end

  def ==(card)
    question == card.question && answer == card.answer && category == card.category
  end
end
