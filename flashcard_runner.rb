require './lib/game'
require './lib/card_generator'
require './lib/deck'
require 'pry'
# @card1 = Card.new('What is the capital of CO?', 'Denver', :Geography)
# @card2 = Card.new('What is the captial of Mexico?', 'Mexico City', :Geography)
# @card3 = Card.new('What is the boiling point (degrees celcius) of water?', '100', :Science)
# @card4 = Card.new('What position did Satchel Paige play?', 'pitcher', :Sports)
# @card5 = Card.new('What element is abbreviated as Cl?', 'chlorine', :Science)
# @cards = [@card1, @card2, @card3, @card4, @card5, @card6]
@cards_generated = CardGenerator.new("cards.txt")
@cards_generated.create_cards
@deck = Deck.new(@cards_generated.cards)



game = Game.new(@deck)
game.start
