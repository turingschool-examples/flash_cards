class Turn
  attr_reader :card, :guess

  def initialize(guess_parameter, card_parameter)
    @guess = guess_parameter
    @card = card_parameter
  end

  def correct?
    if guess == card.answer
      p true
    else
      p false
    end
  end

  def feedback
    if guess == card.answer
      p "Correct!"
    else
      p "Incorrect!"
    end
  end

end
