require './lib/card'

card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

class Turn

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

end
