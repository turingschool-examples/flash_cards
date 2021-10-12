class Turn
  attr_reader :card,
              :guess
  def initialize(string, card)
    @guess = string
    @card = card
  end

  def correct?
    return true if guess == card.answer
    false
  end

  def feedback
    if correct? == true
      "Correct!"
    else
      "Incorrect."
    end
  end
end
