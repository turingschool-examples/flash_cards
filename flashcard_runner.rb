# extra trivia source: https://www.parents.com/fun/activities/indoor/trivia-questions-for-kids/

require './lib/card_generator'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/game'

card_generator = CardGenerator.new("cards.txt")
deck = Deck.new(card_generator.cards)
round = Round.new(deck)
game = Game.new(round)

game.play
