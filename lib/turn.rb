require './lib/card'

class Turn
  attr_reader :guess
  attr_reader :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def guess
    p @guess
  end

  def card
    p @card
  end

  def correct?
    if @guess == @card.answer
      return true
    else
      return false
    end
  end

  def feedback
    if @guess == @card.answer
      p  "Correct!"
    else
      p "Incorrect."
    end
  end
end
