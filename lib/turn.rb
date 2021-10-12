# Turn class declaration.

class Turn
  # Class attribute declaration.
  attr_accessor :guess, :card

  # Initialize definition.
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  # Correct? definition checks if guess is correct.
  def correct?
    @guess == @card.answer ? true : false
  end
end