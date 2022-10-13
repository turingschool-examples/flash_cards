require './lib/card'

class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess.downcase == @card.answer.downcase #.downcase ensure capitalization doesn't cause incorrect answer.
  end

  def feedback
    if correct? #checks the return from the correct? method
      "Correct!"
    else
      "Incorrect."
    end
  end
end
