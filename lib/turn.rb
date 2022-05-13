
class Turn
  attr_reader :guess, :card
  def initialize (guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    if @guess == @card.answer
      true
    else
      false
    end
  end

  def feedback
    return "Correct!" if correct?
    "Incorrect!"
  end 
end
