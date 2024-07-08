require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("What is the principal metal in the manufacturing of steel?", "Iron", :STEM)
card_4 = Card.new("What is the imaginary horizontal line that goes around the middle of the earth?", "Equator", :Geography)
deck = Deck.new([card_1, card_2, card_3, card_4])
total_cards = deck.count
round = Round.new(deck)

puts "\nWelcome to Flash Cards!\n You will be playing with #{total_cards} cards. Good luck!\n"
 puts "================================================\n "

 puts "This is card number #{round.turns.count + 1} out of #{total_cards}."

    puts "\n Question: #{round.current_card.question} \n "
 guess = gets.chomp.capitalize
 round.take_turn(guess)
 puts " \n  #{round.turns.last.feedback} \n\n "

 puts "This is card number #{round.turns.count + 1} out of #{total_cards}."

  puts "\n Question: #{round.current_card.question} \n "
 guess = gets.chomp.capitalize
 round.take_turn(guess)
 puts " \n  #{round.turns.last.feedback} \n\n"

 puts "This is card number #{round.turns.count + 1} out of #{total_cards}."

    puts "\n Question: #{round.current_card.question} \n "
 guess = gets.chomp.capitalize
 round.take_turn(guess)
 puts " \n  #{round.turns.last.feedback} \n\n "

 puts "This is card number #{round.turns.count + 1} out of #{total_cards}."

  puts "\n Question: #{round.current_card.question} \n "
 guess = gets.chomp.capitalize
 round.take_turn(guess)
 puts " \n  #{round.turns.last.feedback} \n\n"

 puts "\n There are no more cards. \n\n" 
 
 puts "**********Game Over************** \n\n"

 puts " \n You had #{round.number_correct} out of #{total_cards} for a total score of #{round.percent_correct} \n\n"

 percent_stem_correct = round.percent_correct_by_category(:STEM)
 p "STEM - #{percent_stem_correct}% correct"
 p "Geography- #{round.percent_correct_by_category(:Geography)}% correct"




  



