class Turn
  attr_reader :guess, :card
  def initialize(string, card)
    @guess = string
    @card = card
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end

  def correct?
    @guess == @card.answer
  end
end
