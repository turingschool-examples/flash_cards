require_relative 'card'
require_relative 'deck'
require_relative 'round'

# Create some Cards
card_1 = Card.new("What is 5 + 5?", "10", :Math)
card_2 = Card.new("What is Rachel's favorite animal?", "Dog", :Turing)
card_3 = Card.new("What is Mike's middle name?", "Nobody knows", :Turing)
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :PopCulture)

# Put those cards into a Deck
deck = Deck.new([card_1, card_2, card_3, card_4])

# Create a new Round using the Deck you created
round = Round.new(deck)

# Start the round using a new method called start
round.start