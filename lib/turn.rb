# frozen_string_literal: true

# Stores guess String Object and Card Object, and evaluates.
class Turn
  attr_reader :card, :guess

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess == @card.answer
  end

  def feedback
    correct? ? 'Correct!' : 'Incorrect.'
  end
end
