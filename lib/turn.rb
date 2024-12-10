class Turn
  attr_reader :guess, :card

  def initialize(guess , card)
    @guess = guess
    @card = card
  end

  def correct?
  #  require "pry"; binding.pry VERY HELPFUL
   @card.answer.strip.upcase == @guess.strip.upcase
  end
  
  def feedback
    if correct?
      "Correct"
    else 
      "Incorrect"
    end
  end

end