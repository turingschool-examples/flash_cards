#require './lib/card'

class Turn
  attr_reader :string, :card 
  def initialize(string,card)
    @string = string
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  end
end
