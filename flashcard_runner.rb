require './lib/round'
require './lib/deck'
require './lib/turn'
require './lib/card'

# Creating some Flash Cards:
card_1 = Card.new("Classes in OOP model what two things?", "state and behavior", :programming)
card_2 = Card.new("Which country is made up of 7,000 islands?", "philippines", :geography)
card_3 = Card.new("What is a traditional fermented Korean side dish made seasoned vegetables and salt?", "kimchi", :food)
card_4 = Card.new("What sea creature has eyelids?", "shark", :animals)
card_5 = Card.new("What country did boba milk tea originate?", "taiwan", :food)
card_6 = Card.new("How many countries does Africa have?", "54", :geography)
card_7 = Card.new("What is a female elephant called?", "cow", :animal)
card_8 = Card.new("Pho is a popular noodle soup from what country?", "vietnam", :food)
card_9 = Card.new("What's the capital of Austria: Vienna, Salzburg, or Klagenfurt?", "vienna", :geography)
card_10 = Card.new("Who invented the Ruby programming language? (last name only)", "matsumoto", :programming)
cards = [card_1,card_2,card_3,card_4,card_5,card_6,card_7,card_8,card_9,card_10]

# Creating a deck
deck = Deck.new(cards)
# Creating a new round
round = Round.new(deck)

round.start