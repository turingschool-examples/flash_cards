class Turn
  attr_accessor :guess, :card, :answer

  def initialize(string, card)
    @guess = string
    @card = card
  end

  def guess
    @guess
  end

  def card
    @card
    @guess
  end

  def correct?
    @guess == @card.answer
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end

end
