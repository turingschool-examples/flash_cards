# frozen_string_literal: true

# class representing one turn of trying a flash card
class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    guess == card.answer
  end

  def feedback
    correct? ? "Correct!" : "Incorrect."
  end
end