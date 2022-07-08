require './lib/round'
require './lib/card_generator'

file_path = './lib/cards.txt'
card_generator = CardGenerator.new(file_path)

deck_1 = Deck.new(card_generator.cards)
round_1 = Round.new(deck_1)

round_1.start


