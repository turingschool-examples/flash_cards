require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

deck = Deck.new(
                [
                  Card.new("What is a group of jelly fish called?", "Smack", :Animals),
                  Card.new("Polar Bears mainly feed on what animals?", "Seals", :Animals),
                  Card.new("How many digits of pi are there?", "Infinity", :Math),
                  Card.new("What is the largest internal organ of the human body?", "Liver", :Anatomy),
                  Card.new("Which bone is the longest bone in the human body?", "Femur", :Anatomy),
                  Card.new("Whats the world's largest ocean?", "Pacific", :Geography),
                  Card.new("What is the largest animal on Earth?", "Blue Whale", :Animals),
                ]
              )
round = Round.new(deck)
round.start
