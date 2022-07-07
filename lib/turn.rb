require './lib/card'

class Turn
  attr_reader :guess
  attr_reader :card

  def initialize(guess, card)
    @card = card
    @guess = guess
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
