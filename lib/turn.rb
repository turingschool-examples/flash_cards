# require './card'

class Turn
  attr_reader   :card
  attr_accessor :guess

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess == card.answer
  end

  def feedback
    if correct? == true
       "Correct!"
    else
       "Incorrect."
    end
  end
end
