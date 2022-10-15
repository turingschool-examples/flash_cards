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

puts "Welcome! You're playing with #{round.deck.count} cards."
puts "This is card number #{} out of #{deck.count}."

puts deck.cards[0].question
guess = gets.chomp
new_turn = round.take_turn("Hippopotamus")
puts round.turns.last.feedback

puts "This is card number #{round.} out of #{deck.count}."
puts deck.cards[0].question
answer = gets.chomp
new_turn = round.take_turn("Giraffe")
puts round.turns.last.feedback

puts "This is card number #{round.current_card} out of #{deck.count}."
puts deck.cards[0].question
answer = gets.chomp
new_turn = round.take_turn("Salem")
puts round.turns.last.feedback

puts "This is card number #{round.current_card} out of #{deck.count}."
puts deck.cards[0].question
answer = gets.chomp
new_turn = round.take_turn("Cheyenne")
puts round.turns.last.feedback

puts "******* GAME OVER! *******"
puts "You had #{} correct guesses out of #{deck.count} for a
total score of #{round.percent_correct}%."
puts "#{card.category} - #{round.percent_correct_by_category(:Animals)} % correct"
puts "#{card.catgory} - #{round.percent_correct_by_category(:Capitals)} % correct"
