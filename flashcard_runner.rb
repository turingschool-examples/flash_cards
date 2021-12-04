require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/game'

# CREATE CARDS FOR GAME
card_1 = Card.new("What sport is dubbed the 'king of sports'?", "Soccer", :Sports)
card_2 = Card.new("Area 51 is located in which state?", "Nevada", :Geography)
card_3 = Card.new("What is the national animal of Scotland?", "Unicorn", :Fun_Facts)
card_4 = Card.new("Dump, floater, and wipe are terms used in which team sport?", "Volleyball", :Sports)
card_5 = Card.new("Which country borders 14 nations and crosses 8 time zones?", "Russia", :Geography)
card_6 = Card.new("Iceland diverted roads to avoid disturbing communities of what?", "Elves", :Fun_Facts)
card_7 = Card.new("What does a 'Geiger Counter' measure?", "Radiation", :STEM)
card_8 = Card.new("True or false – lightning is hotter than the sun.", "True", :STEM)

# PUT CARDS IN DECK
cards = [card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8]
deck = Deck.new(cards)
round = Round.new(deck)

# START THE GAME
game = Game.new(round)
game.start
