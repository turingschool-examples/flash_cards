class Turn
  attr_reader :guess, :card
 def initialize(guess_param,card_param)
    @guess=guess_param
    @card= card_param
  end
  def correct?
    if @guess == @card.answer
      true
    else
      false
    end
  end
  def feedback
    if @guess == @card.answer
      "Correct!"
    else
      "Incorrect!"
    end
  end
end
