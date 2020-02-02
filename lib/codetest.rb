require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

cards = [card1, card2, card3]

deck = Deck.new(cards)

round = Round.new(deck)

p round.current_card

round.take_turn("Juneau")

p round.turns_last_feedback

p round.current_card

round.take_turn("Venus")

p round.turns_last_feedback

p round.number_correct
