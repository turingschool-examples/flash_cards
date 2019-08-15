# require './lib/card'

class Turn
  attr_reader :guess,
              :card

  def initialize(guess_string, card)
    @guess = guess_string
    @card = card
  end

  def correct?
    # TODO: Consider removing if/else `@guess == @card.answer` - now test
    @guess == @card.answer
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end

end
