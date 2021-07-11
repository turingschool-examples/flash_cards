require "./lib/card"
require "./lib/turn"
require "./lib/deck"
require "./lib/round"

# Create some Cards
card_1 = Card.new("What is 5 + 5?", "10", :Math)
card_2 = Card.new("What is the capital of Thailand?", "Bangkok", :Geography)
card_3 = Card.new("Where is the Golden Gate Bridge?", "San Francisco", :Geography)
card_4 = Card.new("Who is the current US president?", "Joe Biden", :Politics)
cards = [card_1, card_2, card_3, card_4]

# Put those cards into a Deck
deck = Deck.new(cards)

# Create a new Round using the Deck you created
round = Round.new(deck)

# Start the round using a new method called start
round.start(round)
