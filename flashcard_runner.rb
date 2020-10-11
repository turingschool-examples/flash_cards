require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

@cards = CardGenerator.new("cards.txt").cards
@deck = Deck.new(@cards)
@round = Round.new(@deck)

@round.start
