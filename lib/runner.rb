require './turn'
require './deck'
require './round'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
cards = [card_1, card_2, card_3]

deck = Deck.new(cards)

# puts deck.cards
# puts deck.count
#
# puts deck.cards_in_category(:STEM)

# round = Round.new(deck)
# puts round.deck
# puts round.turns
# puts round.current_card

new_turn = round.take_turn("Juneau")

# turn = Turn.new("Juneau", card)
#
# puts card.question
# puts card.answer
# puts card.category
#
# puts turn.guess
# puts turn.card
#
# puts turn.correct?
# turn.feedback
