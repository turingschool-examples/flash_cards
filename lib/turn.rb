class Turn

  attr_accessor :card

  def initialize(string, card)
    @string = string
    @card = card
  end

  def guess
    @string
  end

  def correct?
    card.answer == @string ? true : false
  end

  def feedback
    correct? == true ? "Correct!" : "Incorrect."
  end

end
