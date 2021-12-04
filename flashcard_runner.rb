require '.lib/card'
require '.lib/deck'
require './lib/turn'
require './lib/round'


card_1 = Card.new("True or False: 8 is an example of a float.", "False", :Data_types)
card_2 = Card.new("True or False: 'Pandas are cool' is an example of a String.", "True", :Data_types)
card_3 = Card.new("True or False: A boolean in ruby will return True or False.", "True", :Data_types)
card_4 = Card.new("True or False: Horses can sleep standing up.", "True", :Animals)
card_5 = Card.new("True or False: Camels store water in their humps.", "False", :Animals)
card_6 = Card.new("True or False: Female reindeer have antlers.", "True", :Animals)

cards = [card_1, card_2, card_3, card_4, card_5, card_6]

deck = Deck.new(cards)
round = Round.new(deck)

round.start
