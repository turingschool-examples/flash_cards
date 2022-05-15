require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("Question: What is 5 + 5?", "10", :STEM)
card_2 = Card.new("Question: What is Rachel's favorite animal?", "anteater", :"Turing Staff")
card_3 = Card.new("Question: What is Mike's middle name?", "nobody knows", :"Turing Staff")
card_4 = Card.new("Question: What cardboard cutout lives at Turing?", "Justin Bieber", "Pop Culture")
cards = ([card_1, card_2, card_3, card_4])

deck = Deck.new(cards)
round = Round.new(deck)



round.start

puts "****** Game over! ******"
puts "You had correct guesses out #{round.number_correct} of #{deck.cards.count} for a total score of #{round.percent_correct}."
puts "STEM - #{round.percent_correct_by_category(:STEM)} correct"
puts "Turing Staff - #{round.percent_correct_by_category(:"Turing Staff")} correct"
puts "Pop Culture - #{round.percent_correct_by_category("Pop Culture")} correct"
