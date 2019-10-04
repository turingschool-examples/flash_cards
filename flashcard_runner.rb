require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require 'pry'

def start
deck = []

deck << card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
deck << card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
deck << card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
deck << card_4 = Card.new("What TV show is Jennifer Aniston most famous for?", "Friends", "pop culture")
deck << card_5 = Card.new("In what state was the Fresh Prince born and raised?", "Pennsylvania", "pop culture")

original_deck = deck.count
deck = Deck.new(deck)

round = Round.new(deck)
card_number = 0

puts "Welcome! You're playing with #{original_deck} cards."
puts "-" * 50

until deck.count == 0
  card_number += 1

puts "This is card number #{card_number} out of #{original_deck}."

puts "Question: #{round.current_card.question}"
print ">"
player_guess = gets.chomp.capitalize
puts round.take_turn(player_guess).feedback
end

puts "****** Game over! ******"


end
start
