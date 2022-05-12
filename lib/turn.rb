class Turn
  attr_accessor :guess, :card
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess == card.answer
  end

  def feedback
    return "Correct!" if @guess == card.answer
      "Incorrect."
  end
end
