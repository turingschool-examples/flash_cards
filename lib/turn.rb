# The Turn class represents a user's guess at a question.
# It evaluates if the guess is correct and provides feedback.
class Turn
  # Provides read-only access to the guess and the associated card
  attr_reader :guess, :card

  # Initializes a new Turn with a guess and a Card object
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  # Checks if the guess matches the card's answer (case insensitive)
  def correct?
    @guess.downcase == @card.answer.downcase
  end

  # Returns feedback based on whether the guess is correct
  def feedback
    correct? ? "Correct!" : "Incorrect."
  end
end
