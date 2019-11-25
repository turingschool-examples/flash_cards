require './lib/card'
require './lib/round'

class Turn
  attr_reader :card, :guess

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
    @guess == @card.answer
  end

  def feedback
    if @guess == @card.answer
       "Correct!"
    else
      "Incorrect!"
  end

end
end
