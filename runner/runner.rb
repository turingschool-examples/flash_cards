require_relative '../lib/helper'



# require "pry";binding.pry;
card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
cards = [card_1, card_2, card_3]
deck = Deck.new(cards)
# deck.cards_in_category(':Geography')

turn = Turn.new("Juneau", card_1)

round = Round.new(deck)
# require "pry";binding.pry
# new_turn = round.take_turn("Juneau")
# round.take_turn("Juneau")
round.take_turn("some other city")
round.take_turn("Mars")
# require "pry";binding.pry
round.take_turn("North north west")
# round.number_correct
p round.percent_correct
# p round.number_correct_by_category(:STEM)
# p round.current_card
