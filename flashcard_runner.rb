require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is Nearly Headless Nick's full name?", "Sir Nicholas de Mimsy-Porpington", :Harry_Potter)
card_2 = Card.new("What is another name for Burma?", "Myanmar", :Geography)
card_3 = Card.new("What is the chemical symbol for gold?", "Au", :STEM)
cards = [card_1, card_2, card_3]

game_deck = Deck.new(cards)
game_round = Round.new(game_deck)
game_round.start
