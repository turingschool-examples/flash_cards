require './lib/game'
require './lib/card_generator'
require './lib/deck'
require 'pry'

@cards_generated = CardGenerator.new("cards.txt")
@cards_generated.create_cards
@deck = Deck.new(@cards_generated.cards)



game = Game.new(@deck)
game.start
