
class Turn
  attr_reader :guess, :card
  def initialize(string, card)
    @guess = string
    @card = card
  end

  def correct?
    @guess == @card.answer
  end

  def feedback
    if @guess == @card.answer
      return "Correct!"
    else
      return "Incorrect."
    end
  end

end
