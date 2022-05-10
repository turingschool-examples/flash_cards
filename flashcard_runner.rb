require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the capital of Togo?", "lome", :Geography)
card_2 = Card.new("The deepest point in the ocean is called the _______ Trench.", "mariana", :Geography)
card_3 = Card.new("What year did the Titanic sink?", "1912", :History)
card_4 = Card.new("Salvador _______ is a surrealist painter.", "dali", :Art)
deck_1 = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck_1)
round.start
