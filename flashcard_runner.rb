require './lib/deck'
require './lib/card'
require './lib/turn'
require './lib/round'

card_1 = Card.new("What is the capital of New York?", "Albany", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("What is the capital of Colorado?", "Denver", :Geography)
deck = Deck.new([card_1, card_2, card_3, card_4])


def start
  Round.new(deck)
end

def card_number
  @turns.count
end

puts "Welcome! You're playing with #{deck.cards.count} cards!"
puts "-------------------------------------------------"
puts "This is card number #{deck.cards.count + 1 - deck.cards.count} out of #{deck.cards.count}."
