
class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def guess
    return @guess
  end

  def card
    return @card
  end

  def correct?
    guess == card.answer
  end

  def feedback
    if guess == card.answer
      return "Correct!"
    else
      "Incorrect."
    end
  end
end
