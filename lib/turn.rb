require './lib/card'

class Turn
  attr_reader :guess, :card

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

  def correct?
    @guess == @card.answer ? true : false
  end

  def feedback
    correct? ? 'Correct!' : 'Incorrect'
  end
end
