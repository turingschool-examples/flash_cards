require './lib/card'

class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess == guess
  end

  def feedback
    if @guess == guess
      "Correct!"
    end
  end

end
