require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What's the last name of the director of 1954's Seven Samurai?", "Kurosawa", :Directors)
card_2 = Card.new("Whats the last name of the director of 1998's Rushmore?", "Anderson", :Directors)
card_3 = Card.new("What's the last name of the star of  1963's Hud?", "Newman", :Actors)
card_4 = Card.new("What's the last name of the star of 1979's Alien?", "Weaver", :Actors)
card_5 = Card.new("Whats the last name of the writer of 2004's Eternal Sunshine of the Spotless Mind?", "Kaufman", :Writers)
card_6 = Card.new("What's the last name of the writer of 1987's Lethal Weapon?", "Black", :Writers)
deck = Deck.new([card_1, card_2, card_3, card_4, card_5, card_6])
round = Round.new(deck)
round.start
round.play_game



