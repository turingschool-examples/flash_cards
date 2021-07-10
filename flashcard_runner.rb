require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'


def start

  card_set = CardGenerator.new('./lib/cards.txt').make_cards
  deck_1 = Deck.new(card_set)
  round_1 = Round.new(deck_1)
  greeting = "Welcome! You are playing with #{deck_1.count} cards!"
  original_num_cards = deck_1.count

  #require "pry"; binding.pry

  (deck_1.count).times {
    puts greeting
    puts "-------------------------------------------------"
    puts "This is card number #{round_1.used_cards.length + 1} out of #{original_num_cards}"
    puts "#{round_1.current_card.question}"

    guess = gets.chomp #.upcase
    puts round_1.take_turn(guess).feedback
  }
      #for each card category puts percent_correct, use variables
      #get each card category
      #get card category
  puts

  puts "****** Game Over! ******"
  puts "You had #{round_1.number_correct} correct guesses out of #{original_num_cards}, for a total score of #{round_1.percent_correct}%"
  puts "Math - #{round_1.percent_correct_by_category("Math")}% correct"  #make dynamic?
  puts "Dinosaurs - #{round_1.percent_correct_by_category("Dinosaurs")}% correct"
        #need to make as a variable                       #same here
end
start
