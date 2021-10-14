require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

card_1 = Card.new("The 18th Amendment which was ratified in 1919 led to this 13 year illegalization of alcohol?", "The Prohibition", :History)
card_2 = Card.new("What is Kerri's favorite type of food?", "Thai", :Personal)
card_3 = Card.new("Which band has the album 'Make Yourself'?", "Incubus", :Music)
card_4 = Card.new("What is Kerri's cat's name?", "Burton", :Personal)
deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)

number_of_cards = deck.cards.length

puts "Welcome! You're playing with #{number_of_cards} cards."

until deck.cards.length == 0
  puts "This is card number #{round.turns.length + 1} out of #{number_of_cards}."
  puts "Question: #{round.current_card.question}"
  guess = gets.chomp
  round.take_turn(guess)
  turn = Turn.new(guess, round.current_card)
  puts turn.feedback
  round.deck.cards.shift
end

puts "****** Game over! ******"
puts "You have #{round.number_correct}answers correct out of #{number_of_cards}questions for a total score of #{round.percent_correct}%!"
puts "Category- Personal #{round.percent_correct_by_category(:Personal)}%"
puts "Category- Music #{round.percent_correct_by_category(:Music)}%"
puts "Category- History #{round.percent_correct_by_category(:History)}%"
