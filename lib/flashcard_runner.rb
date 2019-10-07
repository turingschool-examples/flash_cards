require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

def start
card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("What is the capital Colorado?", "Denver", :Geography)
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)



  puts "Welcome! You're playing with 4 cards."
  puts "-------------------------------------------------"
  puts "This is card number 1 out of 4"
  puts "What is the capital of Alaska?"
 guess = gets.chomp
 turn = Turn.new(guess, round.current_card)
 p turn.feedback

 puts "This is card number 2 out of 4"
 puts "The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?"
 guess = gets.chomp
 new_turn = round.take_turn(guess)
 p turn.feedback

 puts "This is card number 3 out of 4"
 puts "Describe in words the exact direction that is 697.5° clockwise from due north?"
 guess = gets.chomp
 new_turn = round.take_turn(guess)
 p turn.feedback

 puts "This is card number 4 out of 4"
 puts "What is the capital Colorado?"
 guess = gets.chomp
 new_turn = round.take_turn(guess)
 p turn.feedback

 puts "****** Game over! ******"
 print "You had "; print round.number_correct; print " correct guesses out of 4 for a total score of "; print round.percentage_correct; print " percentage."
end

p start
