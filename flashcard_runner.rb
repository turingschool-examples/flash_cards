require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
# card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("What is 5 + 5", "10", :Mathematics)
# card_5 = Card.new("What is 10 + 5", "15", :Mathematics)
# card_6 = Card.new("What is the capital of Colorado?", "Denver", :Geography)
cards_1 = [card_1, card_2, card_4]
# cards_2 = [card_3, card_5, card_6]
deck_1 = Deck.new(cards_1)
# deck_2 = Deck.new(cards_2)

# round_2 = Round.new(deck_2)

puts "Welcome! You're playing with 3 cards."
puts "-------------------------------------------------"
round_1 = Round.new(deck_1)
number = 1

deck_1.cards.each do |card|
    puts "This is card number #{number} out of #{deck_1.count}"
    puts "Question: #{card.question}"
    answer = gets.chomp
    number += 1
    
    turn_1 = Turn.new("Juneau", card_1)
    turn_2 = Turn.new("Mars", card_2)
    turn_3 = Turn.new("10", card_4)
  puts "****** Game Over! ******"
  puts "you had #{round_1.number_correct} correct out of #{deck_1.count} for a total score of #{round_1.percent_correct}"
  puts "Geography - #{round_1.percent_correct_by_category(:Geography)}%"
  puts "Mathematics - #{round_1.percent_correct_by_category(:Mathematics)}%"
  puts "STEM - #{round_1.percent_correct_by_category(:STEM)}%"
 
 
    
end

