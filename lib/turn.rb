# frozen_string_literal: true

# class representing one turn of trying a flash card
class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    return true if guess == card.answer
    false
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end
end