class Turn

  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    if @guess == @card.answer
      #.upcase, to make sure if someone enters it it works
      true
    else
      false
    end
  end

  def feedback
    if @guess == @card.answer
      "Correct!"
    else
      "Incorrect."
    end
  end

end
