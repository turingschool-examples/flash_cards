
require './lib/card'

class Turn
  attr_accessor :guess, :card
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def guess
    puts "Your guess was #{guess}"
  end

  def correct?
    guess == card.answer
  end
end
