#require './lib/card'

class Turn
  def initialize(string,card)
    @string = string
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  end
end
