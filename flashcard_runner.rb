require './lib/deck'
require './lib/card'
require './lib/turn'
require './lib/round'


card_1 = Card.new("What is 5+5", "10", :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", "Dog", "Turing Staff")
card_3 = Card.new("What is Mike's middle name?", "nobody knows", "Turing Staff")
card_4 = Card.new("What cardboard cutout lives at Turing", "Justin Beiber", "Pop Culture")
deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)



puts "Welcome! You're playing with 4 cards."
puts "-------------------------------------------------"
round.start
puts "This is card number #{round.turns.count + 1} out of #{round.deck_size}"
puts "Question: #{round.deck.cards[0].question}"
round.take_turn(gets.chomp)
p round.turns[0].feedback



puts "This is card number #{round.turns.count + 1} out of #{round.deck_size}"
puts "Question: #{round.deck.cards[0].question}"
round.take_turn(gets.chomp)
p round.turns[1].feedback


puts "This is card number #{round.turns.count + 1} out of #{round.deck_size}"
puts "Question: #{round.deck.cards.first.question}"
round.take_turn(gets.chomp)
p round.turns[2].feedback

puts "This is card number #{round.turns.count + 1} out of #{round.deck_size}"
puts "Question: #{round.deck.cards.first.question}"
round.take_turn(gets.chomp)
p round.turns[3].feedback

puts "****** Game over! ******"
puts "You had #{round.number_correct} correct guesses out of #{round.turns.count} for a total score of #{round.percent_correct}%"

puts "STEM - #{round.percent_correct_by_category(:STEM)}% correct"
puts "Turing Staff - #{round.percent_correct_by_category("Turing Staff")}% correct"
puts "Pop Culture - #{round.percent_correct_by_category("Pop Culture")}% correct"



# Correct!
# This is card number 2 out of 4.
# Question: What is Rachel's favorite animal?
# panda
# Incorrect.
# This is card number 3 out of 4.
# Question: What is Mike's middle name?
# nobody knows
# Correct!
# This is card number 4 out of 4.
# Question: What cardboard cutout lives at Turing?
# Justin Bieber
# Correct!
# ****** Game over! ******
# You had 3 correct guesses out of 4 for a total score of 75%.
# STEM - 100% correct
# Turing Staff - 50% correct
# Pop Culture - 100% correct
