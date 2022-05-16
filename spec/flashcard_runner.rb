require 'rspec'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
# require './lib/card_generator'

card_1 = Card.new("Which element has the symbol 'H'?", "Hydrogen", :ReactiveNonmetals)
card_2 = Card.new("Which element has the symbol 'Ne'?", "Neon", :NobleGases)
card_3 = Card.new("Which element has the symbol 'Xe'?", "Xenon", :NobleGases)
card_4 = Card.new("Which element has the symbol 'B'?", "Boron", :Metalloids)
# filename = "cards.txt"
# cards = CardGenerator.new(filename).cards
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)
round.start
