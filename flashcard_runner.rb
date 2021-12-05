require 'pry'
require './lib/card'
require './lib/deck'
require './lib/round'

card_1 = Card.new("Question: What is 5 + 5?", "10", :STEM)
card_2 = Card.new("Question: What is Rachel's favorite animal?", "squirrel", "Turing Staff")
card_3 = Card.new("Question: What is Mike's middle name?", "nobody knows", "Turing Staff")
card_4 = Card.new("Question: What cardboard cutout lives at Turing?", "Justin Bieber", "Pop Culture")
cards = [card_1, card_2, card_3, card_4]

deck = Deck.new(cards)

round = Round.new(deck)

def start(gogogo)
  p gogogo
end
start(round)

# puts "Welcome! You're playing with 4 cards."
puts "Welcome! You're playing with #{round.deck.cards.size} cards."

50.times do
  print "-"
end

deck.cards.each do

  puts "This is card number #{round.current_card} out of 4"
  puts round.current_card.question
  answer= gets.chomp
  turn = round.take_turn(answer)
  puts turn.correct?
  puts turn.feedback
end

# puts "This is card number 1 out of 4."
# puts card_1.question
# answer = gets.chomp
# turn_1 = round.take_turn(answer)
# puts turn_1.correct?
# puts turn_1.feedback
#
# puts "This is card number 2 out of 4."
# puts card_2.question
# answer = gets.chomp
# turn_2 = round.take_turn(answer)
# puts turn_2.correct?
# puts turn_2.feedback
#
# puts "This is card number 3 out of 4."
# puts card_3.question
# answer = gets.chomp
# turn_3 = round.take_turn(answer)
# puts turn_3.correct?
# puts turn_3.feedback
#
# puts "This is card number 4 out of 4."
# puts card_4.question
# answer = gets.chomp
# turn_4 = round.take_turn(answer)
# puts turn_4.correct?
# puts turn_4.feedback

puts "****** Game over! ******"
puts "You had #{round.correct_turn} correct guesses out of #{round.turns.length}."
