class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    return true if card.answer == guess
    false
  end

  def feedback
    return "Correct!" if card.answer == guess
    "Incorrect."
  end
end