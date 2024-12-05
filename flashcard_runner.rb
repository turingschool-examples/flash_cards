# flashcard_runner.rb - run a sample game session / round

#Required classes and additional facilities
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

require 'pry'

#Create 4 cards and build a deck
card_1 = Card.new("What is 5 + 5?", "10", :STEM)        #NOTE: need .to_s for this kind of guess...add this later!
card_2 = Card.new("What is Rachel's favorite animal?", "Meerkat", :Trivia)  #Why is "\'" not needed?
card_3 = Card.new("What is Mike's middle name?", "Nobody knows", :Trivia)
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Trivia)

deck = Deck.new([card_1, card_2, card_3, card_4])       #Alternate: deck = Deck.new([]), then add cards with my other method
