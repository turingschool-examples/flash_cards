card_1 =
card_2 =
card_3 =
card_4 =

cards = [card_1, card_2, card_3, card_4]

deck = Deck.new(cards)
round = Round.new(deck)

#while deck is full complete this code

print "Welcome! You're playing with 4 cards."
print "______________________________________"
print "This is card number 1 out of 4."
print "Question #{card.question}?" #needs work!

print "Guess:"
guess = gets.chomp
round.take_turn(guess)
puts
puts round.correct?

#end








require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
