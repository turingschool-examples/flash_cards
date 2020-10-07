class Turn
  attr_reader :guess, :card
  def initialize(guess,card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess == @card.answer
  end

  def feedback
    correct? ? "Correct!" : "Incorrect."
  end

  def ==(other)
    other.class == self.class &&
    other.guess == self.guess &&
    other.card == self.card
  end
end
