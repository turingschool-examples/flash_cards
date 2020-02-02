class Turn

  attr_reader :guess, :card

  def initialize(string, card)
    @guess = string
    @card = card
  end

  def correct?
    card.answer == @guess
  end

  def feedback
    correct? ? "Correct!" : "Incorrect."
  end

end
