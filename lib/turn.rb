require './card.rb'

class Turn 
  def initialize(guess, card)
    @guess = guess
    @card = card
    @feedback = ''
  end

  def correct? 
    if guess.upcase == card.answer.upcase
      @feedback = "Correct!"
      true
    else
      @feedback = "Incorrect!"
      false
  end

end
