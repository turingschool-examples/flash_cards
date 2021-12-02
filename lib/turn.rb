require './lib/card'
require 'pry'
class Turn
  attr_reader :guess, :card
  def initialize(guess, card)
    @guess = guess
    @card = card
  end
  def correct?
    @guess == @card.answer
  end
end
#binding.pry
