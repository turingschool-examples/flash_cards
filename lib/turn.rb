class Turn
  attr_reader :string, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def guess
    @string
  end

  def card
    @card
  end

  def correct?
    if @string == card.answer
      true
    else
      false
    end
  end

  def feedback
    if correct? == true
      "Correct!"
    else
      "Incorrect."
    end
  end

end
