class Turn
  def initialize(player_guess, input_card)
    @guess = player_guess
    @card = input_card
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
