class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @card = card
    @guess = guess
  end

  def correct?
    return guess == card.answer
  end

  def feedback
    if correct? == true
      return "Correct!"
    else
      return "Incorrect!"
    end
  end
end
