class Turn
  attr_accessor :guess, :card

  def initialize(guess, card)
    @guess = guess#string
    @card = card#object
  end

  def correct?#stays same for incorrect turn becuase the answer that is being passed through is wrong
    @guess == card.answer
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end
end
