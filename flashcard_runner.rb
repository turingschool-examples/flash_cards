require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require 'pry'

@cards = CardGenerator.new("cards.txt").create_objects
@deck = Deck.new(@cards)
@round = Round.new(@deck)




@round.start

