require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'
require './lib/round.rb'
require './lib/card_generator.rb'

require 'pry'

filename = './files/cards.txt'
generator = CardGenerator.new(filename)
generator.collect
cards = generator.cards
deck = Deck.new(cards)
round = Round.new(deck)

round.start
(cards.length).times do round.display_question end
round.game_over
round.summarize_by_category("Geography")
round.summarize_by_category("SelfKnowledge")
round.summarize_by_category("Music")
round.summarize_by_category("MontyPython")
