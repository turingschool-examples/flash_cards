require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is 5 + 5?", "10", :STEM)
card_2 = Card.new("What is Rachel's favourite animal?", "lion", "Turing Staff")
card_3 = Card.new("What is Mike's middle name?", "nobody knows", "Turing Staff")
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", "Pop Culture")
deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)


puts "Welcome? You're playing with 4 cards."
50.times {print "-"}
puts
puts "This is card number 1 out of 4."
puts card_1.question
answer1 = gets.chomp
turn1 = round.take_turn(answer1)
puts round.turns.last.feedback
puts "This is card number 2 out of 4."
puts card_2.question
answer2 = gets.chomp.downcase
turn2 = round.take_turn(answer2)
puts round.turns.last.feedback
puts "This is card number 3 out of 4."
puts card_3.question
answer3 = gets.chomp.downcase
turn3 = round.take_turn(answer3)
puts round.turns.last.feedback
puts "This is card number 4 out of 4."
puts card_4.question
answer4 = gets.chomp
turn4 = round.take_turn(answer4)
puts round.turns.last.feedback
puts "****** Game Over! ******"
puts "You had #{round.number_correct} guess out of 4 for a total score of #{round.percent_correct}%."
puts "STEM - #{round.percent_correct_by_category(:STEM)}% correct"
puts "Turing Staff - #{round.percent_correct_by_category("Turing Staff")}% correct"
puts "Pop Culture - #{round.percent_correct_by_category("Pop Culture")}% correct"
