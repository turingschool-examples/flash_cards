# A turn is initialized with two arguments.
#1st is a string representing a guess to a card’s question.
#2nd argument is a Card object representing the current flashcard being shown.
class Turn
  attr_reader :guess, :card
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

#This method returns a boolean
#indicating if the guess matched the answer on the Card
  def correct?

  end

#This method either returns "Correct!" or "Incorrect."
#based on whether the guess was correct or not.
  def feedback
    if card.correct? == true
      "Correct!"
    else
      "Incorrect."
  end
end



end
