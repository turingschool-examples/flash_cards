require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What are acceptable reasons for discharge or transfer?", "1", :CLIENT)
card_2 = Card.new("Patients have the right to be free from restraints unless what is obtained?", "2", :CLIENT)
card_3 = Card.new("the ability to understand the feelings of another without pitying them", "3", :COMMUNICATION)
card_4 = Card.new("The “Resident’s Bill of Rights” was put out by which group?", "4", "Ethical Behavior")
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)
round.start
