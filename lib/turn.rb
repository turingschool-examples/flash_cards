class Turn
  attr_reader :card, :guess

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    return true if @guess == @card.answer

    false
  end

  def feedback
    correct? ? "Correct!" : "Incorrect."
  end
end
