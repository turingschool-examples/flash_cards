class Turn

  attr_reader :guess, :card
  def initialize(string, card)
    @guess = string
    @card = card
  end

  def correct?
    return true if @guess == @card.answer
  end

  def feedback
    return "Correct!" if self.correct? == true
    "Incorrect."
  end
end
