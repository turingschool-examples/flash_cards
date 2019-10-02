class Turn

  attr_reader :card, :guess

  def initialize(guess, card)
    @card = card
    @guess = guess
  end

  def correct?
    if @guess == card.answer
      true
    else
      false
    end
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end

end
