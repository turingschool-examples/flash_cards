class Turn

  attr_accessor :guess
  attr_reader :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    if @guess == @card.answer
      return true
    else
      return false
    end
  end

  def feedback
    if @guess == @card.answer
      return "Correct!"
    else
      return "Incorrect"
    end
  end

end
