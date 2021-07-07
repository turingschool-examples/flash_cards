class Turn

  def initialize(string, card)
    @string = string
    @card = card
  end

  def guess
    @string
  end

  def card
    @card
  end

  def correct?
    if @string == @card.answer
      return true
    else
      return false
    end
  end

  def feedback
    if correct? == true
      return "Correct!"
    else
      return "Incorrect."
    end
  end

end
