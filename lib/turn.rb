class Turn

  attr_accessor :card
  attr_reader :string

  def initialize(string, card)
    @string = string
    @card = card
  end

  def guess
    @string
  end

  def correct?
    card.answer == @string
  end

  def feedback
    correct? ? "Correct!" : "Incorrect."
  end

end
