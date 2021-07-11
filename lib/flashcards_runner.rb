require './lib/round'

card_1 = Card.new(
  "What is 5 + 5?", "10", :Math)

card_2 = Card.new(
  "What is Rachel's favorite animal?", "Dog", :Turing_staff)

card_3 = Card.new(
  "What is Mike's middle name?", "Nobody knows", :Turing_staff)

card_4 = Card.new(
  "What cardboard cutout lives at Turing?", "Justin Bieber", :Pop_culture)

cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)




##Beginnning command line interface

puts "Welcome! You're playing with #{cards.count} cards.
-------------------------------------------------"
cards.each do |card|
  puts "This is card number #{cards.index(card) + 1} out of #{cards.count}.
  Question: #{card.question}"

  new_turn = round.take_turn(gets.chomp)

  puts new_turn.feedback
end

puts "****** Game over! ******
You had #{round.number_correct} correct guesses out of #{round.turns.count} for a total score of #{round.percent_correct}.
Math - #{round.percent_correct_by_category(:Math)}
Turing Staff - #{round.percent_correct_by_category(:Turing_staff)}
Pop Culture - #{round.percent_correct_by_category(:Pop_culture)}"
