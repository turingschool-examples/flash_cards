class Turn

  attr_accessor :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
   if @guess.upcase == @card.answer.upcase
    return true
  else
    return false
   end
  end

  def feedback
    if @guess == @card.answer
      p "Correct"
    else
      p "Incorrect"
    end
  end
end
