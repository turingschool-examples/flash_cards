require './lib/round'
require './lib/deck'
require './lib/turn'
require './lib/turn'
require './lib/card'

card_1 = Card.new("What is 5 + 5?", "10", :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", "red panda", :Turing_Staff)
card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing_Staff)
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :PopCulture)

cards = [card_1, card_2, card_3, card_4]

deck = Deck.new(cards)

round = Round.new(deck)

counter = 1

puts "Welcome! You're playing with #{deck.count} cards"
puts "-------------------------------------------------"


until counter > deck.count
  puts "This is card #{counter} out of #{deck.count}"
  puts round.current_card.question
  input = gets.chomp
  turn_1 = round.take_turn(input)
  puts turn_1.feedback
  counter += 1
end

puts "****** Game over! ******"
puts "You had #{round.number_correct} correct guesses out of #{deck.count} for a total score of #{round.percent_correct}"
puts "STEM - #{round.percent_correct_by_category(:STEM).round(0)}% correct"
puts "Turing Staff - #{round.percent_correct_by_category(:Turing_Staff).round(0)}% correct"
puts "Pop Culture - #{round.percent_correct_by_category(:PopCulture).round(0)}% correct"