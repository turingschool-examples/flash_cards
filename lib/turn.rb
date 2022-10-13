class Turn

  attr_reader :guess, :card
  #initialize with *string for @guess* and card (variable created in test)
  def initialize(string, card)
    @guess = string
    @card = card
  end

  #def correct?
  def correct?
    @guess == card.answer
  end

  #def feedback which responds to correct? boolean
  def feedback
    if correct?
      "That's correct!"
    else
      "Sorry, but no..."
    end
  end

end
