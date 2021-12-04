class Turn
  attr_reader :guess, :card


  def initialize(answer_guess, card)
    @guess = answer_guess
    @card = card
  end

  # Checks user guess against the card answer.
  def correct?
    @guess == card.answer
  end

  # Returns feedback to the user after receivng their answer. 
  def feedback
    return "Correct!" if correct?
    "Incorrect."
  end
end
