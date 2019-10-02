class Turn

  attr_reader :card, :guess

  def initialize(guess, card)
    @card = card
    # @question = card.question
    # @answer = card.answer
    # @category = card.category
    @guess = guess
  end

  def correct?
    if self.guess == card.answer
      true
    else
      false
    end
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end

end
