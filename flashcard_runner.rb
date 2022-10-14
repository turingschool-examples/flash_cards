require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'



card_1 = Card.new("Who assassinated Archduke Ferdinand?", "Gavrilo Princip", :History)
card_2 = Card.new("Which character shouts 'It's a trap!' in Star Wars: Return of the Jedi?", "Admiral Ackbar", :"Pop Culture")
card_3 = Card.new("Who won the Nobel Prize for physics in 1932 for their theory of quantum mechanics?", "Werner Heisenberg", :History)
card_4 = Card.new("What is the scientific requirement for life defined as the maintenance of a stable internal environment?", "Homeostasis", :STEM)
card_5 = Card.new("What is the only number that has letters in alphabetical order?", "Forty", :STEM)
card_6 = Card.new("What is the highest grossing movie of all time with a lifetime gross of 	$2,921,872,141?", "Avatar", :"Pop Culture")


deck = Deck.new([card_1, card_2, card_3, card_4, card_5, card_6])
round = Round.new(deck)

start(round)



def start(round)


end
