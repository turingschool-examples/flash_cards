require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

def start
card_1 = Card.new("What is 5 + 5?", "10", "STEM")
card_2 = Card.new("What is Rachel's favorite animal?", "Dog", "Turing Staff")
card_3 = Card.new("What is Mike's middle name?", "nobody knows", "Turing Staff")
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", "Pop Culture")
deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)
number_of_playing_cards = deck.cards.length
puts "Welcome! You're playing with #{number_of_playing_cards} cards."
puts "-------------------------------------------------"
deck.cards.each do |card|
  puts "This card number #{deck.cards.index(card) + 1} out of #{number_of_playing_cards}."
  puts "Question: #{card.question}"
  guess = gets.chomp
  turn = round.take_turn(guess)
  puts turn.feedback
end
puts "****** Game over! ******"
puts "You had #{round.number_correct} correct guesses out of #{number_of_playing_cards} for a total score of #{round.percent_correct}%."
puts "STEM - #{round.percent_correct_by_category("STEM")}% correct"
puts "Truing Staff - #{round.percent_correct_by_category("Turing Staff")}% correct"
puts "Pop Culture - #{round.percent_correct_by_category("Pop Culture")}% correct"
end

start
