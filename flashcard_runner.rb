require 'require_all'
require_all 'lib'

card_1 = Card.new("What is the largest mammal in North America?", "Bison", :Nature)
card_2 = Card.new("What is the largest freshwater fish in North America?", "Sturgeon", :Nature)
card_3 = Card.new("Which muscle group is antagonistic to the quadriceps?", "Hamstrings", :Anatomy)
card_4 = Card.new("How many bones are in the human body?", 206, :Anatomy)

cards = [card_1, card_2, card_3, card_4]

deck = Deck.new(cards)

round = Round.new(deck)

puts "Welcome! You're playing with 4 cards."
puts '------------------------------------------------'

puts "This is card number #{((cards.length - 4) - 1).abs} out of 4."
puts "Question: #{cards[0].question}"
guess = gets.chomp()
round.take_turn(guess.downcase.gsub(/[^a-z]/, '').capitalize)
num = (round.turns.count -1).to_i
puts round.turns.fetch(num).feedback
