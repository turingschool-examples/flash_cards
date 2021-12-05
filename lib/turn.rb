require './lib/card'
require './lib/deck'
class Turn
  attr_reader :guess, :card
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess == @card.answer
  end

  def feedback
    if @guess == @card.answer
      return "Correct!"
    else
      return "Incorrect."
    end
  end
end
#binding.pry
