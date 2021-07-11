require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new('What is 5 + 5?', '10', :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", 'nobody knows', :TuringStaff)
card_3 = Card.new("What is Mike's middle name?", 'nobody knows', :TuringStaff)
card_4 = Card.new('What cardboard cutout lives at Turing?', 'Justin Bieber', :PopCulture)
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)

puts "Welcome! You're playing with #{cards.length} cards."
puts '-------------------------------------------------'

puts "This is card number 1 out of #{cards.length}"
puts "Question: #{round.current_card.question}"
guess = gets.chomp
puts round.take_turn(guess).feedback

puts "This is card number 2 out of #{cards.length}"
puts "Question: #{round.current_card.question}"
guess = gets.chomp
puts round.take_turn(guess).feedback

puts "This is card number 3 out of #{cards.length}"
puts "Question: #{round.current_card.question}"
guess = gets.chomp
puts round.take_turn(guess).feedback

puts "This is card number 4 out of #{cards.length}"
puts "Question: #{round.current_card.question}"
guess = gets.chomp
puts round.take_turn(guess).feedback

puts '****** Game over! ******'
puts "You had #{round.number_correct} correct guesses out of #{cards.length} for a total score of #{round.percent_correct}%."
puts "STEM - #{round.percent_correct_by_category(:STEM)}% correct"
puts "Turing Staff - #{round.percent_correct_by_category(:TuringStaff)}% correct"
puts "Pop Culture - #{round.percent_correct_by_category(:PopCulture)}% correct"
