require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
deck = Deck.new([card_1, card_2, card_3])
round = Round.new(deck)

def start
    # require 'pry'; binding.pry
    puts "Welcome! You're playing with #{round.deck.count} cards."
    puts "--------------------------------------------------"
    puts "This is question #{} out of #{deck.count}."
    puts "Question: #{card_1.question}"
end

puts start
# puts deck.count
# puts card_1.question
# puts round.deck.count