class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?#returns true or false depending on if the instance of card answer argument is equal to the guess argument.
     card.answer == guess
  end

  def feedback#if correct? returns true return "Correct!" if correct? returns false return "Incorrect."
      if correct?
        "Correct!"
      else
        "Incorrect."
    end
  end
end
