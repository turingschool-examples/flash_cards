require '../lib/card'
require '../lib/turn'
require '../lib/deck'
require '../lib/round'
require 'pry'

card_1 = Card.new("Question: 1 + 1 = ?", 2, :Math)
card_2 = Card.new("Question: 1 + 2 = ?", 3, :Math)
card_3 = Card.new("Question: What food do I like to eat now?", "Humus", :Food)

cards = [card_1, card_2, card_3]

deck = Deck.new(cards)
round = Round.new(deck)
