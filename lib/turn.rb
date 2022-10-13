class Turn
attr_reader :card, :guess

  def initialize(string, card)
    @guess = string
    @card = card
  end

  def correct?
    @guess == card.answer
  end

  def feedback
    if correct? == true
       "Correct!"
    else "Incorrect."
    end
  end
end
