require './lib/card.rb'
require './lib/round.rb'
require './lib/deck.rb'
require './lib/turn.rb'
require './lib/card_generator.rb'

filename = 'cards.txt'

card = CardGenerator.new(filename).cards

deck = Deck.new(card)

round = Round.new(deck)

round.start
