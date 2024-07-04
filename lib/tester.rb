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
require './lib/turn'
require './lib/deck'
require './lib/round'

require 'rspec'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
cards = [card_1, card_2, card_3]
deck = Deck.new(cards) # the array of cards object
round = Round.new(deck)

# puts deck.cards_in_category(:STEM)


new_turn = round.take_turn("Juneau")
round.number_correct
puts round.number_correct_by_category(:Geography)
puts round.number_correct_by_category(:STEM)

# new_turn = round.take_turn("Venus")

# puts round.currnet_card
# puts 
# puts round.currnet_card.question
# round.new_card
# puts
# puts round.currnet_card.question
# round.new_card
# puts
# puts round.currnet_card.question
# round.new_card
# puts
# puts round.deck.count
# puts round.currnet_card.question
# puts round.currnet_card.class

# ruby lib/tester.rb

# puts deck.cards[0].category

