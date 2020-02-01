class Turn
  attr_reader :guess
  def initialize(guess, card)
    @card = card
    @guess = guess
  end

  def card
    @card
  end

  def correct?
     @guess == card.answer
    end
  end

  def feedback
    if @guess == card.answer
      "Correct!"
    else
      "False!"
    end
  end

end
