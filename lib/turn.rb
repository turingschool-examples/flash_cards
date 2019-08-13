class Turn

  attr_reader :guess, :card
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def guess
    @guess
  end

  def card
    Card
  end

  def correct?
    return True if guess == answer
    False
  end

  def feedback
    return "Correct!" if guess == answer
    "Incorrect."
  end

end
