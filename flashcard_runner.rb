require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require './lib/flashcardrun'

card_1 = Card.new("Who has the most career points in the NHL", "Wayne Gretzky", :Sports)
card_2 = Card.new("Who won the UEFA Champions League in 2021", "Chelsea", :Sports)
card_3 = Card.new("How many movies are there in the Harry Potter series?", "8", :Entertainment)
card_4 = Card.new("What year did The Lord of the Rings: The Fellowship of the Ring release?", "2001", :Entertainment)
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
first_round = Round.new(deck)
new_game = FlashCardRun.new(first_round)
new_game.start(first_round)
