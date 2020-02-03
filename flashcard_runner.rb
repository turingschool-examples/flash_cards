require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

## Cards! ##

card1 = Card.new("H20 is an abbreviation for what common liquid?", "water", :STEM)

card2 = Card.new("What is the capital of Mississippi?", "jackson", :Geography)

card3 = Card.new("Who killed Alexander Hamilton", "aaron burr", :History)

card4 = Card.new("Which ocean is the island of Hawaii located in?", "pacific", :Geography)

cards = [card1, card2, card3, card4]

deck = Deck.new(cards)

round = Round.new(deck)

round.start

guess1 = gets.chomp.downcase

round.take_turn(guess1)

round.turns.last.feedback

print "This is card number 2 out of "

print deck.cards.count

print ".\n"

puts "Question:"

print deck.cards[1].question

print ".\n"

guess2 = gets.chomp.downcase

round.take_turn(guess2)

round.turns.last.feedback

print "This is card number 3 out of "

print deck.cards.count

print ".\n"

puts "Question:"

print deck.cards[2].question

print ".\n"

guess3 = gets.chomp.downcase

round.take_turn(guess3)

round.turns.last.feedback

print "This is card number 4 out of "

print deck.cards.count

print ".\n"

puts "Question:"

print deck.cards[3].question

print ".\n"

guess4 = gets.chomp.downcase

round.take_turn(guess4)

round.turns.last.feedback

p "****** Game over! ******"

print "You had "
print round.number_correct
print " correct guesses out of "
print deck.cards.count
print ".\n"
print "for a total score of"
print round.percent_correct
print "%"
print ".\n"
print "STEM -"
print round.percent_correct_by_category(:STEM)
print "% correct .\n"
print "Geography -"
print round.percent_correct_by_category(:Geography)
print "% correct .\n"
print "History -"
print round.percent_correct_by_category(:History)
print "% correct .\n"
