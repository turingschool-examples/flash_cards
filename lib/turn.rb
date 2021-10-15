class Turn
  def initialize(guess, card)
    @guess = guess
    @card = card
    @correct_answers = [] # this might not be needed.
  end

  def guess
    @guess
  end

  def card
    @card
  end

  def correct?
    @guess == card.answer
  end

  def feedback
    if correct? == true
      return "Correct!"
    else
      return "Incorrect."
    end

  end
end
