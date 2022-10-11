require './lib/card'

class Turn
  def initialize(string, card)
    @guess = string
    @card = card
  end

  def guess
    @guess
  end

  def card
    @card
  end

  def correct?
    guess == card.answer
  end

  def feedback
    correct? ? "Correct!" : "Incorrect"
  end
end