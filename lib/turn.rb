class Turn 
  def initialize(guess, card)
    @guess = guess
    @card = card
    @feedback = ''
  end

  def guess
    @guess
  end

  def card
    @card
  end

  def correct? 
    if @guess.upcase == @card.answer.upcase
      feedback(true)
    else
      feedback(false)
    end
  end

  def feedback bool
    if bool
      p "*****Correct!*****"
    else
      p "*****Incorrect!*****"
    end
  end
end