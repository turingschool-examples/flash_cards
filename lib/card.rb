
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

class Turn
  def initialize(guess_param, card)
    @guess = guess_param
  end

  def guess
    p @guess
  end

  def correct?
    guess_lower = @guess.lowercase
    result = answer.include?(card.answer)
    p result
  end

  def feedback
    if result == true
      p "Correct!"
    else
      p "Incorrect"
  end
end

turn = Turn.new("Juneau")
