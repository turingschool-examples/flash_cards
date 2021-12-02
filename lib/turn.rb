require_relative 'card'

class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    guess.casecmp?(card.answer)
  end
end
