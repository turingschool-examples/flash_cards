class Turn
  attr_accessor :card, :string

  def initialize(string, card)
    @string = string
    @card = card
  end

  def guess
    @string
  end

  def correct?
    @string == @card.answer
  end

  def feedback
    if @string == @card.answer
      return "Correct!"
    else
      return "Incorrect."
    end
  end
end
