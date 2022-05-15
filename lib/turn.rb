class Turn
  attr_reader :card

  def initialize(string, card)
    @string = string
    @card = card
  end

  def guess
    @string
  end

  def correct?
    if @string == @card.answer
      return true
    else
      return false
    end
  end

  def feedback
    if @string == @card.answer
      return "Correct!"
    else
      return "Incorrect."
    end
  end

end
