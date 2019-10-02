#runner.rb

require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is 2 + 3", "5", :Math)
card_2 = Card.new("What is 10 * 2", "20", :Math)
card_3 = Card.new("What is 15 / 5", "3", :Math)
card_4 = Card.new("What is 3 + 2 + 3","8",:Math)
card_5 = Card.new("What is the capital of Illinois?","Springfield",:Geography)
card_6 = Card.new("What is the capital of Texas?","Austin",:Geography)
card_7 = Card.new("What is the capital of Colorado?","Denver",:Geography)
card_8 = Card.new("What is the capital of Michigan?","Lansing",:Geography)
card_9 = Card.new("What is the price of a MacBook Pro?","1200",:PIR) # price is right
card_10 = Card.new("What is the price of a iPhone?","1000",:PIR)

cards = [card_1, card_2, card_3,
        card_4, card_5, card_6,
        card_7, card_8, card_9, card_10]

deck = Deck.new(cards)
round = Round.new(deck)

round.start

# require 'pry'; binding.pry
