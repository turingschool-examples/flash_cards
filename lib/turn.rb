# frozen_string_literal: true

# Takes a card and guess as input. Checks guess against the answer on the card, then provides feedback.
class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess.downcase == card.answer.downcase
  end

  def feedback
    if correct?
      'Correct!'
    else
      'Incorrect.'
    end
  end
end
