class Turn
  attr_reader :guess,
              :card,
              :correct

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess == card.answer
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect"
    end
  end

end
