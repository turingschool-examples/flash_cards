require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require 'pry'


deck = []
deck << card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
deck << card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
deck << card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
deck << card_4 = Card.new("What TV show is Jennifer Aniston most famous for?", "Friends", "pop culture")


deck = Deck.new(deck)

p deck.count



def start
round = Round.new(deck)

# Er, what am I doing here?
# Try turning some of the round stuff into hashes?


puts "Welcome! You're playing with #{deck.count} cards."
puts "-" * 50
  card_number = 0
until deck.count = 0


puts "This is card number #{card_number =+ 1} out of #{deck.count}."

puts "Question: #{round.current_card.question}"
print ">"
player_guess = gets.chomp
puts round.take_turn(player_guess).feedback
# There should be some sort of loop... keep going until no cards left .. number of turns = number of cards in Deck
end
#
# puts "This is card number 2 out of 4."
# puts "Question: #{round.current_card.question}"
# print ">"
# player_guess = gets.chomp
# puts round.take_turn(player_guess).feedback

end
start
