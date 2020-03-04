class Turn
  def initialize(guess, card)   
    @guess = guess
    @card = card
  end

  def guess
    @guess
  end

  def card
    @card
  end

  def isCorrect?
    self.guess == self.card.answer ? true : false
  end

  def feedback
    self.isCorrect? ? "Correct!" : "Incorrect!"
  end
end