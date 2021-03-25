# source https://www.parents.com/fun/activities/indoor/trivia-questions-for-kids/
require './lib/game'
require './lib/round'
require './lib/card'
require './lib/deck'
require './lib/turn'

card_1 = Card.new("How many teeth does an adult human have?", "32", :Science)
card_2 = Card.new("How many noses does a slug have?", "4", :Science)
card_3 = Card.new("Where was Martin Luther King, Jr. born?", "Atlanta", :History)
card_4 = Card.new("Which was the first country to use paper money?", "China", :History)
deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)
game = Game.new(round)

game.play
