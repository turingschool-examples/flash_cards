class Turn
  attr_reader :guess, :card, :answer
  def initialize(guess, card)
    @guess = guess
    @card = card
    @answer = card.answer
  end

  def guess
    @guess
  end

  def card
    @card
  end

  def correct?
    @answer == @guess
  end

  def feedback
    if @answer == @guess
      "Correct!"
    else
      "Incorrect."
    end
  end

end
