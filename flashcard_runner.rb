require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

#card = Card.new(question, answer, category)
card_1 = Card.new("What does '!true' evaluate to in boolean logic?", "False", :Boolean_Logic)
card_2 = Card.new("True of False: '||' is the logical AND operator?", "False", :Boolean_Logic)
card_3 = Card.new("What Boolean will the following return? False || True", "True", :Boolean_Logic)
card_4 = Card.new("True or False: A Ternary Operator is a single-line 'If' statement", "True", :Syntactic_Fun)
card_5 = Card.new("True or False: You need comma's after each attribute in an 'attr_reader'?", "True", :Dumb_Shit_Ive_Done)
card_6 = Card.new("True of False: Eric often out-thinks himself.", "True", :Dumb_Shit_Ive_Done)

cards = [card_1, card_2, card_3, card_4, card_5, card_6]

deck = Deck.new(cards)
round = Round.new(deck)

round.start
