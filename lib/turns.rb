class Turns
  attr_reader :guess,
              :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end
end
