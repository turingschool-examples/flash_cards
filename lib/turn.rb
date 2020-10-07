require './lib/turn'
require './lib/card'

class Turn
attr_reader :guess


  def initialize(guess, card)
    @guess = guess
  end

  def correct?
    if card.answer == @guess
      return true
    else
      return false
    end
  end

def feedback
  if card.answer == @guess
    "Correct!"
  else
    "Incorrect."
  end
end

end
