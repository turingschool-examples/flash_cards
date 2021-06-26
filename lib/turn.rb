class Turn
  attr_reader :guess, :card, :correct
  def initialize(guess, card)
    @guess = guess
    @card = card
    @correct = true
  end

  def correct?
    if @guess == @card.answer
      @correct
    else
      false
    end
  end

  def feedback
    if @guess == @card.answer
      p "Correct!"
    else
      p "Incorrect"
    end
  end
end
