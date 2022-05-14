require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

filename = "cards.txt"
card_generator = CardGenerator.new(filename)
card_generator.add_cards
deck = Deck.new(card_generator.cards)
round = Round.new(deck)

round.start
round.end
round.final_score
