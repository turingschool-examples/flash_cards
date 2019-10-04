require './lib/card'
require './lib/turn'
require './lib/deck'
require 'pry'

#card = Card.new("What is the capital of Alaska?", "Juno", :Geography)

card_1 = Card.new("What is the capital of Alaska?", "Juno", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
  and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5°
  clockwise from due north?", "North north west", :STEM)

cards = [card_1, card_2, card_3]
turn = Turn.new("WTF", cards[1])
deck = Deck.new(cards)

binding.pry

deck.cards
deck.count
deck.cards_in_category(:STEM)
deck.cards_in_category(:Geography)
deck.cards_in_category(:"Pop Culture")
