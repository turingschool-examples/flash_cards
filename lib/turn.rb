class Turn
  attr_reader :guess,
              :card

  #create a turn
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  #evaluates correctness of guess with true/false
  def correct?
    guess == card.answer
  end

  #evaluates correctness of guess with Correct!/Incorrect.
  def feedback
    if guess == card.answer
      "Correct!"
    else
      "Incorrect."
    end
  end

end
