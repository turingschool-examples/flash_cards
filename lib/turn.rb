require './lib/card'

class Turn
  attr_reader :guess, 
              :card

  def initialize(guess, card)
    @card = card
    @guess = guess
  end

  def correct?
    if @guess.downcase == @card.answer.downcase
      return true
    else
      return false
    end
  end

  def feedback
    if @guess.downcase == @card.answer.downcase
      return "Correct!"
    else
      return "Incorrect."
    end
  end
end