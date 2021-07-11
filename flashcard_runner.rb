require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the name of my cat?", "Mabel", :Pets)
card_2 = Card.new("What type of beer is sour and made with coriander and salt?", "Gose", :Beer)
card_3 = Card.new("What is the name of a type of climbing hold that is big and easy to grip?", "Jug", :Climbing)
card_4 = Card.new("What was the name of my childhood puppy?", "Cera", :Pets)
card_5 = Card.new("What is the name of a type of climbing hold that is tiny and sharp?", "Crimp", :Climbing)
card_6 = Card.new("What type of beer comes from the Cologne region of Germany?", "Kolsch", :Beer)


cards = [card_1, card_2, card_3, card_4, card_5, card_6]
deck = Deck.new(cards)
round = Round.new(deck)

puts "Welcome! You're playing with #{cards.count} cards."
40.times {print "-"}
puts
p "This is card #{round.turns.count+1} out of #{cards.count}"
p "#{card_1.question}"
card_answer = gets.chomp
if card_answer.capitalize == card_1.answer
  p "Correct!"
else
  p "Incorrect! The correct answer is #{card_1.answer}"
end

new_turn = round.take_turn("Juneau")
p "This is card #{round.turns.count+1} out of #{cards.count+1}"
p "#{card_2.question}"
card_answer = gets.chomp
if card_answer.capitalize == card_2.answer
  p "Correct!"
else
  p "Incorrect! The correct answer is #{card_2.answer}"
end

new_turn = round.take_turn("Juneau")
p "This is card #{round.turns.count+1} out of #{cards.count+2}"
p "#{card_3.question}"
card_answer = gets.chomp
if card_answer.capitalize == card_3.answer
  p "Correct!"
else
  p "Incorrect! The correct answer is #{card_3.answer}"
end
