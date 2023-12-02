require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Which caracther saves Bran Stark?", "Hordor", :PopCulture)
card_4 = Card.new("Whats the Capital of Brazil?", "Brasilia", :Geography)
@cards = [card_1, card_2, card_3, card_4]
deck = Deck.new([card_1, card_2, card_3, card_4])

@round = Round.new(deck)

