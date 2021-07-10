require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/game'

card_1 = Card.new("What is the capital of Maine?", "Augusta", :Geography)
card_2 = Card.new("What is the Game of Games?", "Chardee MacDennis", :TV)
card_3 = Card.new("Who won the Stanley Cup in 1996 during their inaugural season?", "Colorado Avalanche", :Sports)
card_4 = Card.new("Who said, You miss 100 percent of the shots you don't take - Wayne Gretzky", "Michael Scott", :TV)
card_5 = Card.new("Which baseball player has the most career hits?", "Pete Rose", :Sports)

cards = [card_1, card_2, card_3, card_4, card_5]

deck = Deck.new(cards)
round = Round.new(deck)

game = Game.new(round)
game.start_game
