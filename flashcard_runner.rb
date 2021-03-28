require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is 5+5?", "10", :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", "Cat", :Turing_Staff)
card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing_Staff)
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Beiber", :Pop_Culture)
cards  = [card_1, card_2, card_3, card_4]
deck   = Deck.new([card_1, card_2, card_3, card_4])
round  = Round.new(deck)

puts "Welcome! You're playing with 4 cards."

puts "This is card number 1 out of 4."
puts round.current_card.question
guess = gets.chomp
puts round.take_turn(guess).feedback


puts "This is card number 2 out of 4."
puts round.current_card.question
guess = gets.chomp
puts round.take_turn(guess).feedback

puts "This is card number 3 out of 4."
puts round.current_card.question
guess = gets.chomp
puts round.take_turn(guess).feedback

puts "This is card number 4 out of 4."
puts round.current_card.question
guess = gets.chomp
puts round.take_turn(guess).feedback

puts "Game Over!"
puts "you had #{number_correct} out of 4 for a total score of #{percent_correct}"
puts
