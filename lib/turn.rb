require './lib/card'

class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
    @answer = @card.answer
  end

  def correct?
    return true if @guess = @card.answer
    false
  end

  def feedback
    if @guess == @answer
        "Correct!"
    else
        "Incorrect."
    end
  end  
end