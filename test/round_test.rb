require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

deck = Deck.new([card_1, card_2, card_3])
round = Round.new(deck)

puts round.deck
p round.turns
p round.current_card

puts '-' * 10

turn_1 = round.take_turn("Juneau")

puts turn_1.class
puts turn_1.correct?

puts '-' * 10

p round.turns
puts round.number_correct

puts '-' * 10

p round.current_card

turn_2 = round.take_turn("Venus")

puts '-' * 10

puts round.turns.count
puts round.turns.last.feedback
puts round.number_correct
puts round.number_correct_by_category(:Geography)
puts round.number_correct_by_category(:STEM)

puts '-' * 10

puts round.percent_correct
puts round.percent_correct_by_category(:Geography)
puts round.number_correct_by_category(:STEM)

puts '-' * 10

p round.current_card
