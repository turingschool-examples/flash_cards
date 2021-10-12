
class Card
  def question
    p "What is the capital of Alaska?"
  end

  def answer
    p "Juneau"
  end

  def category
    p :Geography
  end
end

card = Card.new
card.question
card.answer
card.category
