require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'



card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
deck = Deck.new([card_1, card_2, card_3])
round = Round.new(deck)
deck_size = deck.cards.length



round.start

new_turn = round.take_turn(gets.strip)
puts new_turn.feedback
puts "This is card number 2 out of #{deck_size}."
puts "#{deck.cards[0].question}"
new_turn = round.take_turn(gets.strip)
puts new_turn.feedback
puts "This is card number 3 out of #{deck_size}."
puts "#{deck.cards[0].question}"
new_turn = round.take_turn(gets.strip)
puts new_turn.feedback

round.complete