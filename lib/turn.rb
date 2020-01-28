class Turn
  attr_reader :string

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def guess
    @guess
  end

  def card
    @card
  end

  def correct?
    @guess == card.answer
  end

  def feedback
    @guess == card.answer ? "Correct!" : "Incorrect."
  end
end
