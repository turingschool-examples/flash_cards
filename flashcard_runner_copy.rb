require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
card_1 = Card.new("What is the name of the floating bone located in your neck?", "Hyoid", :Anatomy)
card_2 = Card.new("What is 5 times 3", "15", :Math)
card_3 = Card.new("What is 60 squared?", "3600", :Math)
card_4 = Card.new("What are the main flexor/extensor pair of muscles in the upper arms called?","Biceps and Triceps",:Anatomy)
deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)

def start
  puts "Welcome!"
  50.times do
    print "-"
  end
end
start
puts " "
puts "You're playing with #{round.deck.cards.length} cards."
puts "This is card number 1 out of #{round.deck.cards.length}."
puts "Question: #{card_1.question}"
guess_1 = gets.chomp
turn_1 = round.take_turn(guess_1)
puts turn_1.feedback

puts "This is card number 2 out of #{round.deck.cards.length}."
puts "Question: #{card_2.question}"
guess_2 = gets.chomp
turn_2 = round.take_turn(guess_2)
puts turn_2.feedback

puts "This is card number 3 out of #{round.deck.cards.length}."
puts "Question: #{card_3.question}"
guess_3 = gets.chomp
turn_3 = round.take_turn(guess_3)
puts turn_3.feedback

puts "This is card number 4 out of #{round.deck.cards.length}."
puts "Question: #{card_4.question}"
guess_4 = gets.chomp
turn_4 = round.take_turn(guess_4)
puts turn_4.feedback
puts "****** Game over! ******"
puts "You had #{round.number_correct} correct guesses out of 4 for a total score of #{round.percent_correct}%"
puts "Math - #{round.percent_correct_by_category(:Math)}% correct"
puts "Anatomy - #{round.percent_correct_by_category(:Anatomy)}% correct"
