class Turn
  def initialize(guess,card)
    @guess = guess
    @card = card
  end

  def guess
    @guess
  end
  
  def card
    @card
  end
  
  def correct?
    @card.answer.downcase == @guess.downcase
  end
  
  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end
end