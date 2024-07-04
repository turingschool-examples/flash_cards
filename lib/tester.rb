# require './lib/turn'
# require './lib/card'


# card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# turn = Turn.new("Juneau", card)

# puts turn.card.question
# puts card

# puts turn.correct?
# puts turn.feedback

# test_array = []

# if test_array.class != Array
#     puts "not an array"
# else
#     puts "it's an array"
# end

require './lib/card'
require './lib/deck'
require 'rspec'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
cards = [card_1, card_2, card_3]
deck = Deck.new(cards) # the array of cards object


p deck.cards_in_category(:Geography)

# puts deck.cards[0].category