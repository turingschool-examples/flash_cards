class Turn
  attr_reader :string, :card
  def initialize(string, card)
    @string = string
    @card = card
  end

  def guess
    @string
  end

  def correct?
    guess.downcase == card.answer.downcase
  end

  def feedback
    return "Incorrect." if correct? == false
    "Correct!"
  end
end
