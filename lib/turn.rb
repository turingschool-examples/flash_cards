# frozen_string_literal: true

# Takes a card and guess as input. Checks guess against the answer on the card, then provides feedback.
class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess.downcase
    @card = card
  end

  def correct?
    if card.alternate_answer.nil?
      @guess == card.answer
    else
      @guess == card.answer || @guess == card.alternate_answer
    end
  end

  def feedback
    if correct?
      'Correct!'
    else
      'Incorrect.'
    end
  end
end
