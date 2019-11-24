require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697 .5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("What is JLO short for?", "Jennifer Lopez", :Pop_culture)
binding.pry
cards = [card_1, card_2, card_3, card_4]

deck = Deck.new(cards)


# i = 0
#
# p "Welcome! You're playing with #{@cards.count} cards."
# p"-------------------------------------------------"
# p "This is card number #{@deck.card.first} out of #{@cards.count}."
# p "Question: #{@card.question}?"
#
# i += 1
