class Turn
  attr_accessor :guess, :card, :correct
  def initialize(guess, card)
    @guess = guess
    @card = card
    @correct = nil
  end

  def correct?
    @correct = @guess == card.answer
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect!"
    end
  end

end
