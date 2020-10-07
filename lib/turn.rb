class Turn
  attr_reader :card, :guess

  def initialize(guess, card)
    @card = card
    @guess = guess
  end
end
