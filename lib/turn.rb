require './lib/card'

class Turn
  attr_reader :guess, :card

  def initialize(new_guess, new_card)
    @guess = new_guess
    @card = new_card
  end
end
