class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
<<<<<<< HEAD
    guess == card.answer
  end
=======
    guess == card
>>>>>>> d84564ef930ea3a87ade50f2ce92453e41bb48ec

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end
end
