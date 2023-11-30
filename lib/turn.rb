require './lib/card'

class Turn
  attr_reader :card,
              :guess
  
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess == @card.answer
  end

  
end