class Turn
  attr_reader :string, :card

  def initialize(string, card)
    @card = card
    @string = string
  end

  def guess
    string
  end
def correct?
  if guess == card.answer
    true
  else
    false
  end
end
  def feedback
    if correct? == true
      return "Correct!"
    else
      return "Incorrect!"
    end
  end
end
