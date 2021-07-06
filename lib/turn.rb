class Turn
  attr_accessor :string, :card

  def initialize(string, card)
    @string = string
    @card = card
  end

  def guess
    string
  end

  def card
    @card
  end

  def correct?
    if self.guess == card.answer
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
