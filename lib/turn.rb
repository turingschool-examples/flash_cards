
class Turn
  attr_reader :guess,
              :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess == @card.answer
    # if @guess == @card.answer
    #   true
    # else
    #   false
    # end
  end

  def feedback
    if self.correct? == true
      return "Correct!"
    else
      return "Incorrect."
    end
  end
end
