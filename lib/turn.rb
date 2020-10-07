class Turn
  attr_reader :guess,
              :card

  def initialize(string, card)
    @guess = string
    @card = card
  end

  def guess
    @guess
  end

  def correct?
    guess.downcase == card.answer.downcase
  end

  def feedback
    return "Incorrect." if correct? == false
    "Correct!"
  end
end
