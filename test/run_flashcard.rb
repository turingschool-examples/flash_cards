require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card2 = Card.new("The beaver is the national emblem of what country?", "Canada", :Geography)
card3 = Card.new("In what year was the last NBA expansion?", 2004, :Sports)
card4 = Card.new("What sport did an astronaut play on the moon in 1971?", "Golf", :Sports)

cards =[card1, card2, card3, card4]

deck = Deck.new(cards)
round = Round.new(deck)

binding.pry
