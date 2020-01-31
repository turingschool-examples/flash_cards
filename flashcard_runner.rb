require './lib/card.rb'
require './lib/round.rb'
require './lib/deck.rb'
require './lib/turn.rb'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("What is my middle name?", "Patrick", :Personal_info)

deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)

puts "Welcome! You're playing with 4 cards"
puts '-------------------------------------------------'
puts "This is card number 1 out of 4."
puts card_1.question
turn_1 = round.take_turn(gets.chomp)

turn_1.feedback

# require "pry"; binding.pry
