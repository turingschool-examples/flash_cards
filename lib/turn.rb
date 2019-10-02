class Turn
  attr_reader :guess, :card, :correct
  def initialize(guess, card)
    @guess    = guess
    @card     = card
    @correct  = false
  end

  def correct?
    if @guess == @card.answer
      @correct = true
    else
      @correct = false
    end
  end

  def feedback
    if @correct == true
      p "Correct!"
    else
      p "Incorrect!"
    end
  end
end
