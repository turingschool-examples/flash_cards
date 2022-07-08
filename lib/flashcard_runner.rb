require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'



card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("In what state is Turing located?", "Colorado", :Geography)
card_3 = Card.new("The extra file we can make to help us test & run code is called the ________ file.", "runner", :CS)
card_4 = Card.new("What is the capital of Louisiana?", "Baton Rouge", :Geography)
card_5 = Card.new("The four types of loops are do while time and _____", "until", :CS)
card_6 = Card.new("What you have and where you have access to it is called the ________", "scope", :CS)
card_7 = Card.new("The two directories you need when creating classes are spec & _____", "lib", :CS)
cards = [card_1, card_2, card_3, card_4,card_5, card_6, card_7]
deck = Deck.new(cards)
round = Round.new(deck)

round.start
guess1 = gets.chomp
round.show_card(guess1)
guess2 = gets.chomp
round.show_card(guess2)
guess3 = gets.chomp
round.show_card(guess3)
guess4 = gets.chomp
round.show_card(guess4)
guess5 = gets.chomp
round.show_card(guess5)
guess6 = gets.chomp
round.show_card(guess6)
guess7 = gets.chomp
round.show_card(guess7)
