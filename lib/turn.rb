require './lib/card'

class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card

  end

# Checks whether the guess matches the answer
  def correct?
     @guess == @card.answer
  end

end
