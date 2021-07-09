
class Turn
  attr_reader :card, :guess
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    if @card.answer == @guess
      true
    else
      false
    end
  end

  def feedback
    if @card.answer == @guess
      "Correct!"
    else
      "Incorrect."
    end
  end
end
