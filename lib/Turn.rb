class Turn
  attr_reader :guess, :card
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess.casecmp?(@card.answer)
  end

  def feedback
    return "Correct!" if correct?
    return "Incorrect." if not correct?
  end

end
