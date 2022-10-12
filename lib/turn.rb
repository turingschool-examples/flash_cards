class Turn
  attr_reader :guess, :card

  def initialize(string, card)
    @guess = string
    @card = card
  end

  def correct?
    if @guess == @card.answer
      true
    else
      false
    end
  end

  def feedback 
    if correct?
       "Correct!"
    else
      "Incorrect"
    end
  end

end