require "./lib/card"
require "./lib/deck"
require "./lib/turn"
require "./lib/round"
require "./lib/card_generator"

  filename = "cards.txt"

  round = Round.new(Deck.new(CardGenerator.new(filename).cards))
  round.start
