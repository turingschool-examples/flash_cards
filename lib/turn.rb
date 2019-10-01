class Turn
  attr_reader :card, :guess

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
      puts "Correct!"
      true
    else
      puts "Incorrect!"
      false
    end
  end

end
