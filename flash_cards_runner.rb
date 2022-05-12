require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/card_generator'

filename = '.lib/trivia_cards.txt'

 cards = Card_generator.new(filename)

deck = Deck.new(cards)

round = Round.new(deck)

round.start

require 'pry'; binding.pry
