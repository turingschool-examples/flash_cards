# test_runner.rb - for running sample code while building out / testing classes
#NOTE: also create handy irb session with this at the bottom!
#NOTE: I created this before getting to iteration 3, where I see we make another runner file

require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
#Can I just do one line of "require './lib/'?  Or is that not precise / good written habit?"

#Testing out basic card, turn, and deck functionality:
card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

cards = [card_1, card_2, card_3]

deck = Deck.new(cards)

puts "HELLO I'M GETTING HERE"

puts deck.cards()
puts deck.count()
puts "STEM cards: #{deck.cards_in_category(:STEM)}"
puts "Geography cards: #{deck.cards_in_category(:Geography)}"
puts "\"Pop culture\" cards: #{deck.cards_in_category("Pop culture")}"

puts "ABOUT TO MOVE TO ROUND STUFF"

#Add round functionality with a first round:

round = Round.new(deck)

puts round.deck
p round.turns           #puts won't print empty brackets.  Seem to be multiple differences between puts, p, print
puts round.current_card

#Manually provide static input for now
new_turn = round.take_turn("Juneau")

puts new_turn.class
puts new_turn.correct?()

puts round.turns
puts round.number_correct()
puts round.current_card      #Verify we've moved to the next card in the deck

#Do a second round:
round.take_turn("Venus")
puts round.turns.count()
puts round.turns.last.feedback()     #Verify the most recent (second) turn is wrong
puts round.number_correct()
puts "# correct Geography guesses: #{round.number_correct_by_category(:Geography)}"
puts "# correct STEM guesses: #{round.number_correct_by_category(:STEM)}"
puts round.percent_correct()
puts round.percent_correct_by_category(:Geography)
puts round.current_card


#Now run it in irb to make checking variables, etc. easy!
# require 'irb'
# binding.irb
#UPDATE: pry is a bit fancier / better at debugging, so may just use this moving forward:
require 'pry'
binding.pry
