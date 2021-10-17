require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("Question: What is 5 + 5?", "10", :STEM)
card_2 = Card.new("Question: What is the color of grass?", "Green", :Color)
card_3 = Card.new("Question: What is Wade's middle name?", "Collin", :Person)
card_4 = Card.new("Question: What is my favorite pet?", "Dog", :Person)
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)




puts "Welcome! You're playing with 4 cards."
puts "-" * 30
puts "This is card 1 out of 4"
puts round.deck.cards[0].question
guess = gets.chomp
turn = round.take_turn(guess)
puts turn.feedback
puts "This is card number 2 out of 4."
puts round.deck.cards[0].question
guess = gets.chomp
turn = round.take_turn(guess)
puts turn.feedback
puts "This is card number 3 out of 4."
puts round.deck.cards[0].question
guess = gets.chomp
turn = round.take_turn(guess)
puts turn.feedback
puts "This is card number 4 out of 4."
puts round.deck.cards[0].question
guess = gets.chomp
turn = round.take_turn(guess)
puts turn.feedback
puts "****** Game over! ******"
puts "You had #{round.number_correct} correct guesses out of 4 for a total score of #{round.percent_correct}%."
puts "STEM -#{round.percent_correct_by_category(:STEM)}%correct."
puts "Color -#{round.percent_correct_by_category(:Color)}%correct."
puts "Person -#{round.percent_correct_by_category(:Person)}%correct."
