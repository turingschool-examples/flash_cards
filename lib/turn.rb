require './lib/card'

class Turn
  attr_reader :guess, 
              :card

  def initialize(guess, card) #create Turn
    @card = card
    @guess = guess
  end

  def correct? #return boolean value of if card guess matches the card's answer
    if @guess.downcase == @card.answer.downcase
      return true
    else
      return false
    end
  end

  def feedback #return string version of above method
    if @guess.downcase == @card.answer.downcase
      return "Correct!"
    else
      return "Incorrect."
    end
  end
end