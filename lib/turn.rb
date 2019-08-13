class Turn

  def initialize(string, card)
    @guess = string
    @card = card
  end

  def guess
    @guess
  end

  def card
    @card
  end

  def correct?
    if @guess == @card.answer
      true
    elsif @guess != @card.answer
      false
    end
  end

  def feedback
    if correct? == true
      feedback =  "Correct!"
    elsif correct? != true
      feedback = "Incorrect!"
    end
  end

end
