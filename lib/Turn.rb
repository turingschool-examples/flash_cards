class Turn
  attr_accessor :string, :card

  def initialize(string, card)
    @string = string
    @card = card
  end

  def guess(current_guess)
    #returns a guess
  end

  def card(current_card)
    #returns a card
  end

  def correct
    #returns a bool
  end

  def feedback
    #returns "correct" or "incorrect"
  end
end

  