
class Turn
  attr_accessor :card, :guess

  def initialize (guess, card)
    @guess = guess
    @card = card
  end

  def correct?
   @guess == card.answer
  end

  def feedback
    if @guess == card.answer
      p "Correct!"
    else
      p "Incorrect."
    end
  end
end
