require './lib/card'

class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    return true if @guess = @answer
    return true if @guess = @card.answer
   false
  end

  def feedback
    return "Incorrect." if @guess != @card.answer
    "Correct!"
  end

end



