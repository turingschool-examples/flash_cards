require './lib/turn'
require './lib/turn'

describe Turn do

  @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  @turn = Turn.new("Juneau", card)
end
