# Class for creating a turn with a guess input and taking a specific card
class Turn
  attr_reader :guess, :card

  def initialize(string, card)
    @guess = string
    @card = card
  end

  # Check if the guess is correct (equal to the answer)
  def correct?
    @guess == @card.answer
  end

  # Give the user feedback based on if their answer is right or wrong
  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end
end
