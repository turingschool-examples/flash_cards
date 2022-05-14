require_relative 'helper'

class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess == @card.answer
  end

  def feedback
    return 'Correct!' if correct? == true
    return 'Incorrect.' if correct? == false
  end

end
