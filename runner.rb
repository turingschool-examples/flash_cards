require './lib/card'
require 'pry'
require './lib/turn'
require './lib/deck'


card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5 clockwise from due north?", "North north west", :STEM)

cards = [card_1, card_2, card_3]

deck = Deck.new(cards)


# card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# card_1.question("What is the capital of Alaska?")
# card_1.answer("Juneau")
# card_1.category(:Geography)
#
# print card_1.question
#  if answer == "Juneau"
#    puts "Nice work!"
#  elsif answer != "Juneau"
#    puts "Try again!"
#    puts card_1.question
#  elsif answer = "Juneau"
#    puts "Way to go!"
#  else answer != "Juneau"
#    puts "Let's move on"

binding.pry
