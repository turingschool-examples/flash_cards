require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

card_generator = CardGenerator.new('cards.txt')
deck = Deck.new(card_generator.convert_to_cards)
round = Round.new(deck)

round.start