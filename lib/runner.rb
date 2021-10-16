require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'




# # deck testing
# card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#
# card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
#   and reports about the surface of which planet?", "Mars", :STEM)
# card_3 = Card.new("Describe in words the exact direction that is 697.5°
#   clockwise from due north?", "North north west", :STEM)
#
# cards = [card_1, card_2, card_3]
#
# deck = Deck.new(cards)
# puts deck
# puts 'deck cards'
# puts deck.cards
# puts 'deck count'
# puts deck.count
# puts "cards in category"
# puts deck.cards_in_category(:STEM)
#
# puts 'cards 1-3 categories'
# puts card_1.category
# puts card_2.category
# puts card_3.category


# round testing
# card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#
# card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
#   and reports about the surface of which planet?", "Mars", :STEM)
#
# card_3 = Card.new("Describe in words the exact direction that is 697.5°
#   clockwise from due north?", "North north west", :STEM)
#
# deck = Deck.new([card_1, card_2, card_3])
# puts deck
#
# round = Round.new(deck)
#
# new_turn = round.take_turn("Juneau")
#
# puts round.current_card.answer
# puts round.current_card.question
# puts round.current_card.category
#
#
# puts round.current_card.answer
# puts round.current_card.question
# puts round.current_card.category
#
# puts round.number_correct_by_category(:Geography)
# puts round.number_correct_by_category(:STEM)
#
# puts round.percent_correct
#
# puts round.percent_correct_by_category(:Geography)

#iteration 3 testing
