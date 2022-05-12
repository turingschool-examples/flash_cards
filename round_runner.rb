require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'


card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
deck = Deck.new([card_1, card_2, card_3])
round = Round.new(deck)
round.current_card
new_turn = round.take_turn("Juneau")
p round.turns

# p round.current_card


# card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# turn = Turn.new("Juneau", card)
# p turn.card.class
