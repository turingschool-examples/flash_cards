require './lib/deck'

class Turn
  attr_reader :guess, :card

  def initialize(string, card)
    @guess = string
    @card = card
  end

  def is_correct?
    @guess == @card.answer
  end

  def feedback
    is_correct? ? "Correct!" : "Incorrect."
  end

end
