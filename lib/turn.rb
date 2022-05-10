class Turn

attr_reader :string, :card

  def initialize(string, card)
    @string = string
    @card = card
  end

  def guess
    @string
  end

  def card
    @card
  end

  def correct?
    @string == card.answer
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Not correct."
    end
  end

end
