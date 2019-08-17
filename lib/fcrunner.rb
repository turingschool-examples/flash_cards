require './turn'
require './card'
require './deck'

# card_1 = Card.new("What is the capital of Alaska", "Juneau", ":Geography")
# turn = Turn.new("Juneau", card_1)
#
# p turn.card
# p turn.correct?
# p turn.guess
# turn.feedback


card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

deck = Deck.new

deck.add_card_to_deck(card_1)
deck.add_card_to_deck(card_2)
deck.add_card_to_deck(card_3)

# @cards = [card_1, card_2, card_3]
p deck.cards
deck.count
deck.cards_in_category(':geography')
