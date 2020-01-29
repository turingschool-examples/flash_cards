require_relative 'round'

class Turn < Round
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess == @card.answer
  end

  def feedback
    correct? ? "Correct" : "Incorrect"
  end
end
