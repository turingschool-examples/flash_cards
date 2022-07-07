require 'pry'

class Turn
  attr_accessor :card, :guess

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def guess
    @guess
  end

  def card
    @card
  end

  def correct?
    @card.answer == @guess
  end

  def feedback
    correct? ? "Correct!" : "Incorrect."
  end


end
