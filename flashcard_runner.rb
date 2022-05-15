# Create some Cards
# Put those card into a Deck
# Create a new Round using the Deck you created
# Start the round using a new method called start
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the worlds smallest country?", 'Vatican City', :Geography)
card_2 = Card.new("Where are one quarter of all the bones in our body found?", 'Feet', :STEM)
card_3 = Card.new("A cloud can weigh more than a million pounds. True or False?", 'True', :STEM)
card_4 = Card.new("What is the hottest planet in our solar system?", 'Venus', :STEM)
card_5 = Card.new("Which country grows about 5 CM per year?", 'Iceland', :Geography)
deck = Deck.new([card_1, card_2, card_3, card_4, card_5])

round = Round.new(deck)
round.start
