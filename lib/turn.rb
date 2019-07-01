class Turn
  attr_reader :card, :guess

  def initialize(guess, card)
    @card = card
    @guess = guess
  end

  def correct?
    @guess == @card.answer
  end

  def feedback
    if @guess == @card.answer
      "Correct!"
    else
      "Incorrect!"
    end
  end
end
