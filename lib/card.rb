
class Card
  def initialize(question_param, answer_param, category_param)
    @question = question_param
    @answer = answer_param
    @category = category_param
  end

  def question
    p @question
  end

  def answer
    p @answer
  end

  def category
    p @category
  end
end

card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card.question
card.answer
card.category
