require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/game_start'
require './lib/card_generator'

# card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
# card_3 = Card.new("Which caracther saves Bran Stark?", "Hordor", :PopCulture)
# card_4 = Card.new("Whats the Capital of Brazil?", "Brasilia", :Geography)
filename = "cards.txt"
cards = CardGenerator.new(filename).cards
deck = Deck.new(cards)
flashcard_generator = Start.new(deck)


flashcard_generator.start