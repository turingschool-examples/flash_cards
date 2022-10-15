# create some cards
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

# class CLI_game
#     def initialize
#         start
#     end
#     #  58 seconds

#     def start
#         puts "Welcome!"

#     end


# end

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
deck = Deck.new([card_1, card_2, card_3])
round = Round.new(deck)
# require 'pry'; binding.pry
deck_size = deck.cards.length



round.start

new_turn = round.take_turn(gets.strip)
puts new_turn.feedback
puts "This is card number 2 out of #{deck_size}."
puts "#{deck.cards[0].question}"


# put those cards into a deck
# create a new round using the deck you created
# start the round using a new method called start
