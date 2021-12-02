class Turn
  attr_reader :guess, :card


  def initialize(answer_guess, card)
    @guess = answer_guess
    @card = card
  end

  def correct?
    @guess == card.answer
  end

  def feedback
    return "Correct!" if correct?
    "Incorrect."
  end
end
