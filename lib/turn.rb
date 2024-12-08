# frozen_string_literal: true

# Takes a card and guess as input. Checks guess against the answer on the card, then provides feedback.
class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess.downcase
    @card = card
  end

  def correct?
    card.answers.include?(@guess)
  end

  def feedback
    if correct?
      'Correct!'
    else
      'Incorrect.'
    end
  end
end
