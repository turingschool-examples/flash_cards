require './lib/card'


class Turn
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def guess
    @guess
  end

  def card
     Card
  end

  def correct?
     @answer == @guess
  end

  def feedback
    if correct? == true
       "Correct!"
      else "Incorrect."
    end
  end
end
