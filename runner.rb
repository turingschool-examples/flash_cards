require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

card_1 = Card.new("What is your favorite color?!" 'Blue!', "Monty Python", :Movie)
card_2 = Card.new("Do or do not...There is no try", "Star Wars", :Movie)
card_3 = Card.new("Shot me in the goddamn liver, Morty!", "Rick and Morty", :TV)

deck = Deck.new([card_1, card_2, card_3])

round = Round.new(deck)

binding.pry
