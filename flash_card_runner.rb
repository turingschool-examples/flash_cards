require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

@data = File.open('./lib/cards.txt').readlines.map(&:chomp)
@cards = CardGenerator.new(@data).cards
@deck = Deck.new(@cards)
@round = Round.new(@deck)

@round.start
@round.display_results

require "pry"; binding.pry
