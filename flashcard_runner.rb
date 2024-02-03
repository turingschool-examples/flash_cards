require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'


# card = Card.new(question, answer, category)
# turn = Turn.new(guess, card)
# deck = Deck.new(cards)
# round = Round.new(deck)

# card_1 = Card.new("What is 1+1?", "2", :Math)
# card_2 = Card.new("What is 2+2?", "4", :Math)
# card_3 = Card.new("What is 3+3?", "6", :Math)
# card_4 = Card.new("What is the meaning of life?", "42", :Philosophy)
card_generator = CardGenerator.new("cards.txt")
deck = Deck.new(card_generator.cards)
round = Round.new(deck)

round.start