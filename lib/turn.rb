# require './lib/card'

class Turn
  attr_reader :guess,
              :card

  def initialize(guess_string, card)
    @guess = guess_string
    @card = card
  end

  def correct?
    if @guess == @card.answer
      true
    else
      false
    end
  end

  def feedback
    if correct?
      "Great job!"
    else
      "Incorrect"
    end
  end

end
