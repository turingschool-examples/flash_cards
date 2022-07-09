require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require 'pry'


cards = CardGenerator.new("cards.txt").cards

deck = Deck.new(cards)
round = Round.new(deck)

round.start
guess1 = gets.chomp
round.show_next_card(guess1)
guess2 = gets.chomp
round.show_next_card(guess2)
guess3 = gets.chomp
round.show_next_card(guess3)
guess4 = gets.chomp
round.show_next_card(guess4)
guess5 = gets.chomp
round.show_next_card(guess5)
guess6 = gets.chomp
round.show_next_card(guess6)
guess7 = gets.chomp
round.show_next_card(guess7)
