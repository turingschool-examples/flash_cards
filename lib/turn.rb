class Turn
  attr_reader :guess, :card

  def initialize(guess, current_card)
    @card = current_card
    @guess = guess
  end

  def correct?
    if @guess == @card.answer
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect!"
    end
  end
end
end
