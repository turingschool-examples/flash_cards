class Turn
  def initialize(playerGuess, inputCard)
    @guess = playerGuess
    @card = inputCard
  end

  def guess
    return @guess
  end

  def card
    return @card
  end

  def correct?
    if @guess == @card.answer
      return true
    else
      return false
    end
  end

  def feedback
    if correct?
      return "Correct!"
    else
      return "Incorrect."
    end
  end

end
