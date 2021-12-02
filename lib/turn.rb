class Turn
  attr_reader :guess, :card
  
  def initialize(guess, card)
    @guess = guess
    @card = card
    @correct = true
  end

  def correct?
    if @guess == card.answer
      @correct
    else
      @correct = !@correct
    end
  end

  def feedback
    if @guess == card.answer
      "Correct!"
    elsif @guess != card.answer
      "Incorrect."
    end
  end
end
