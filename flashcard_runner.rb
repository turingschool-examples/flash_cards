require "./lib/card"
require "./lib/deck"
require "./lib/turn"
require "./lib/round"

  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft was sent to which planet?", "Mars", :STEM)
  card_3 = Card.new("What is the airspeed velocity of an unladen swallow?", "African or European?", :STEM)
  cards = [card_1, card_2, card_3]

  round = Round.new(Deck.new(cards))
  round.start
