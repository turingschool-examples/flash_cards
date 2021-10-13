# Richard Tillies
# October 12, 2021
# Turn class
# ~/turing/1module/projects/lib/turn.rb

class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess == @card.answer
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end
end
