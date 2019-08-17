require './lib/card'
require 'pry'

class Turn
  attr_reader :guess, :card

  def initialize(new_guess, new_card)
    @guess = new_guess
    @card = new_card
  end

  def correct?
    @guess == @card.answer
  end
end
