require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/play'
require './lib/card_generator'

filename = "aliyas_cards.txt"
cards = CardGenerator.new(filename).cards
deck = Deck.new(cards)
round = Round.new(deck)
play = Play.new(round)

play.start
play.card_review
play.score_by_category
