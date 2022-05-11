class Turn
  attr_reader :card, :guess

  def initialize(string, card)
    @card = card
    @guess = string
  end

  def correct?
    @guess == card.answer
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end 
end
