require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/flash_round'
require './lib/card_generator'
# card_1 = Card.new("Question: 5 + 5?", "10", :STEM)
# card_2 = Card.new("Question: What is Rachel's favorite animal?","Donkey", :Turing)
# card_3 = Card.new("Question: What is Mike's middle name?", "nobody knows", :Turing)
# card_4 = Card.new("Question: What cardboard cutout lives at turing?", "Justin Bieber", :PopCulture)
# deck = Deck.new([card_1, card_2, card_3, card_4])
# round = Round.new(deck)
# round_counter = 0
#card_counter = 4

def start
  puts "Welcome!  You're playing with #{round.deck.count} cards."
  puts "--------------------------------------------------"

while round_counter < 4 do
  round_counter += 1
    puts "This is card number #{round_counter} out of 4. \n     #{round.current_card.question}"
    turn_FR = round.take_turn(gets.chomp)
    puts "#{turn_FR.feedback}"
  end

  puts "***** Game over! *****"
  puts "You had #{round.number_correct} correct guesses out of 4 for a total score of #{round.percent_correct}%."
  puts "STEM - #{round.percent_correct_by_category(:STEM)}% correct"
  puts "Turing Staff - #{round.percent_correct_by_category(:Turing)}% correct"
  puts "Pop Culture - #{round.percent_correct_by_category(:PopCulture)}% correct"
end
