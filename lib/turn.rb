
require_relative 'card'
require_relative 'deck'


class Turn
  attr_accessor :guess, :card
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    if guess == card.answer
      "Correct"
    else
      "Incorrect"
    end
  end
end


