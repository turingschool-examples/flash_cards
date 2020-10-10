require './lib/card'
require './lib/turn'
require './lib/deck'
require "./lib/round"
require './lib/dialogue'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("Who sang the song 'Love me, I'm a liberal'?", "Phil Ochs", :MUSIC)
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)

# again from intro, this takes the number of cards and prints a welcome message
welcome(round.deck.count)
