require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

def start
    # Creates object instances
    cards = []
    
    cards << Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    cards << Card.new("The Viking spacecraftsent back to Earth photographs and reportsabout the surface of which planet?","Mars", :STEM)
    cards << Card.new("Describe in words theexact direction that is 697.5° clockwisefrom due north?", "North north west", :STEM)

    deck = Deck.new(cards)
    
    Round.new(deck)
end

round = start

puts "Welcome! You're playing with #{round.deck.count} cards."