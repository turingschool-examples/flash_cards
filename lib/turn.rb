# frozen_string_literal: true

# Takes a card and guess as input. Checks guess against the answer on the card, then provides feedback.
class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    # Is the guess equal to the answer on the card? Returns true or false
    @guess == card.answer
  end

  def feedback
    # Instead of reinventing the wheel, this if statement calls the correct? method we defined earlier
    if correct?
      'Correct!'
    else
      'Incorrect.'
    end
  end
end
