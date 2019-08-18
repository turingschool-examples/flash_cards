class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    # compares guess to card answer
    guess == card.answer
  end

  def feedback
    # returns response based on guess correctness
    return "Correct!" if correct?
    "Incorrect."
  end
end
