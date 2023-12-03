require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class Runner
  def initialize
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    card_4 = Card.new("How many episodes does Friends sitcom have?", "236 eps", :Movies)
    card_5 = Card.new("Who is the first Asian actor/actress to win Oscar?", "Michelle Yeoh", :Movies)
    collection_card = [card_1, card_2, card_3, card_4, card_5]
    @deck = Deck.new(collection_card)
    @round = Round.new(@deck)
  end
end
