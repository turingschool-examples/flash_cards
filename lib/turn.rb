require './lib/card'

class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def is_correct?
    if @guess == card.answer
      true
    end
  end


end
