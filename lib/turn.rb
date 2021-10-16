class Turn
  def initialize(guess, card)
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
    @guess == card.answer
  end

  def feedback
    if correct?
      return "Correct!"
    else
      return "Incorrect."
    end

  end
end
