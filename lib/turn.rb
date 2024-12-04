class Turn
  attr_reader :guess, :card

  def initialize(guess , card)
    @guess = guess
    @card = card
  end

  def correct?
  #  require "pry"; binding.pry VERY HELPFUL
   @card.answer == @guess
  end
end