require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'

card_1 = Card.new("What mammal has the most powerful bite?", "Hippopotamus", :Animals)
card_2 = Card.new("What animal has the highest blood pressure?", "Giraffe", :Animals)
card_3 = Card.new("What is the capital of Oregon?", "Salem", :Capitals)
card_4 = Card.new("What is the capital of Wyoming?", "Cheyenne", :Capitals)

deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)

puts "Welcome! You're playing with #{deck.count} cards."
puts "This is card number #{(round.turns.count + 1)} out of #{deck.count}."

puts deck.cards[0].question
guess = gets.chomp
new_turn = round.take_turn(guess)
puts round.turns.last.feedback

puts "This is card number #{(round.turns.count + 1)} out of #{deck.count}."
puts deck.cards[0].question
guess = gets.chomp
new_turn = round.take_turn(guess)
puts round.turns.last.feedback

puts "This is card number #{(round.turns.count + 1)} out of #{round.deck.count}."
puts deck.cards[0].question
guess = gets.chomp
new_turn = round.take_turn(guess)
puts round.turns.last.feedback

puts "This is card number #{(round.turns.count + 1)} out of #{round.deck.count}."
puts deck.cards[0].question
guess = gets.chomp
new_turn = round.take_turn(guess)
puts round.turns.last.feedback

puts "******* GAME OVER! *******"
puts "You had #{round.number_correct} correct guesses out of #{round.deck.count} for a total score of #{round.percent_correct}%."
puts "#{:Animals} - #{round.percent_correct_by_category(:Animals)} % correct"
puts "#{:Capitals} - #{round.percent_correct_by_category(:Capitals)} % correct"
