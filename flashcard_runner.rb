require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

card_1 = Card.new("What is 5 + 5?", "10", :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", "red panda", :Turing_Staff)
card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing_Staff)
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", "Pop Culture")
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)

puts "Welcome! You're playing with #{deck.count} cards."
puts "-" * 50

round.start

puts "****** Game Over! ******"
puts "You had #{round.number_correct} out of #{deck.cards.count} correct for a total score of #{round.percent_correct.to_i}%"
puts "STEM - #{round.percent_correct_by_category(:STEM)}% correct"
puts "Turing Staff - #{round.percent_correct_by_category(:Turing_Staff)}% correct"
puts "Pop Culture - #{round.percent_correct_by_category("Pop Culture")}% correct"
