class Turn
  attr_accessor :guess
  attr_reader :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end
end
