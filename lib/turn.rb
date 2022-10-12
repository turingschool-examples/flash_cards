class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end
  def card
    @card
  end
end
# require 'pry'; binding.pry
