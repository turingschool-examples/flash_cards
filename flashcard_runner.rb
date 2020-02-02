require './lib/card.rb'
require './lib/round.rb'
require './lib/deck.rb'
require './lib/turn.rb'
require './lib/card_generator.rb'

filename = 'cards.txt'

cards = [card_1, card_2, card_3, card_4]

deck = Deck.new(cards)
card = CardGenerator.new(filename).cards

deck = Deck.new(card)

round = Round.new(deck)

round.start
