require './lib/card'

class Turn

  attr_accessor :guess,
                :card


  def initialize(guess, card)
    @guess = guess
    @card = card

  end

  def card
    @card
  end

  def guess
    @guess
  end

  def correct?
    @guess == @card.answer
  end

  def feedback
    if @guess == @card.answer
      "Correct!"
    else
      "Incorrect."
    end
  end
end
