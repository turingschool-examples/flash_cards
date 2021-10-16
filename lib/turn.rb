require './lib/card'


class Turn

  attr_reader :guess, :card

  #guess = guess, card = current flashcard
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    #does this work?
    @guess == card.answer
  end 

  def feedback
    if correct?
      return "Correct!"
    else
      return "Incorrect."
    end
  end

end
