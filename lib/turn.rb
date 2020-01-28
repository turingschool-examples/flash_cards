class Turn
  attr_accessor :question, :answer, :category, :guess

  def initialize(string, card)
    @question = card.question
    @answer = card.answer
    @category = card.category
    @guess = string
  end

  def guess
    @guess
  end

  def card
    Card.new(@question, @answer, @category)
  end

  def correct?
    @guess == @answer ? true : false
  end

  def feedback
    correct? == true ? "Correct!" : "Incorrect"
  end
end
