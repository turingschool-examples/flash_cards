require 'pry'
require_relative './round'
require_relative './card'
require_relative './deck'
require_relative './turn'
require_relative './card_generator'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("What is 5 + 5?", "10", :Mathmatics)
card_5 = Card.new("What is Gwendolyn's favorite animal?", "Angry Panda", "Turing Students")
card_6 = Card.new("What is Mike's middle name?", "Nobody knows", "Turing")
card_7 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", "Turing")
card_8 = Card.new("Is Shirley a Colorado native?", "Yes", "Turing Students")

# filename = "cards.txt"

# cards = CardGenerator.new(filename).cards # cards method that turns text file into cards

deck = Deck.new([card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8])

round = Round.new(deck)

round.take_turn(round.start)
