#require './lib/card'

class Turn
  attr_reader :guess, :card

  def initialize(string,card)
    @guess = string
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  end

  def correct?
    return true if @guess == card.answer
    false
  end

  def feedback
    return "Correct!" if @guess == card.answer
    "Incorrect."
  end
end
