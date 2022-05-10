require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the capital of Togo?", "lome", :Geography)
card_2 = Card.new("Saipan and Guam are located near which underseas topographical feature in the Pacific Ocean?", "mariana trench", :Geography)
card_3 = Card.new("What year did the Titanic sink?", "1912", :History)
card_4 = Card.new("What style of art is Salvador Dali known for?", "surrealism", :Art)
deck_1 = Deck.new([card_1, card_2, card_3, card_4])
first_round = Round.new(deck_1)

puts "Welcome! You're playing with #{deck_1.cards.length} cards."
puts "-" * 30

total_cards = deck_1.cards.length + first_round.used_cards.length

# when card_number <= 4 /or/ deck.cards.length > 0

card_number = 1
# first_round.deck.cards.each do |c|
puts "This is card number #{card_number} out of #{total_cards}."
puts "Question: #{card_1.question}"
answer_1 = gets.chomp.to_s.downcase
first_turn = first_round.take_turn(answer_1)
puts first_turn.feedback

card_number += 1
puts "This is card number #{card_number} out of #{total_cards}."
puts "Question: #{card_2.question}"
answer_2 = gets.chomp.to_s.downcase
second_turn = first_round.take_turn(answer_2)
puts second_turn.feedback

card_number += 1
puts "This is card number #{card_number} out of #{total_cards}."
puts "Question: #{card_3.question}"
answer_3 = gets.chomp.to_s.downcase
third_turn = first_round.take_turn(answer_3)
puts third_turn.feedback

card_number += 1
puts "This is card number #{card_number} out of #{total_cards}."
puts "Question: #{card_4.question}"
answer_4 = gets.chomp.to_s.downcase
fourth_turn = first_round.take_turn(answer_4)
puts fourth_turn.feedback

# when deck.cards == []

puts "***** Game over! *****"
puts "You had #{first_round.number_correct} out of #{total_cards} for a total score of #{first_round.percent_correct.to_i}%."
used_cards_by_cat = first_round.used_cards.group_by do |c|
  c.category
end
stats = used_cards_by_cat.each do |k,v|
  puts "#{k} - #{first_round.percent_correct_by_category(k)}% correct"
end
