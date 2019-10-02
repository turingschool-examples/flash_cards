require './lib/card'

class Turn
  attr_accessor :answer, :card, :correct

  def initialize(answer, card)
    @answer = answer
    @card = card
    @correct = false
  end

  def guess
    guess = @answer
  end

  def card
    @card.question
  end

  def correct?
    @correct = guess == @card.answer
  end

  def feedback
    if @correct == true
      "Correct!"
    else
      "Incorrect. Try Again."
    end
  end

end
