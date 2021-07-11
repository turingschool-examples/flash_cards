class Turn
  attr_reader :guess,
              :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess == card.answer
  end

  def feedback
    return "Correct!" if @guess == card.answer
    "Incorrect."
  end
end

#end of iteration 1 complete the turn and Card
#lib and spec files
