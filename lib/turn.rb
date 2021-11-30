#require './lib/card'

class Turn
  attr_reader :guess, :card 
  def initialize(string,card)
    @guess = string
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  end
end
