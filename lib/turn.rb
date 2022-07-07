require './lib/card'

class Turn
  attr_reader :guess
  attr_reader :card

  def initialize(guess, card)
    @card = card
    @guess = guess
  end

  def correct?
    if @guess == @card.answer
      return true
    else
      return false
    end
  end

  def feedback
    if @guess == @card.answer
      puts  "Correct!"
    else
      puts "Incorrect."
    end
  end
end
