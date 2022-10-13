require './card'

require './turn'

require './deck'

require './round'

card_1 = Card.new("What is your name?", "Lancelot", :Personal)

card_2 = Card.new("What is your quest?", "I seek the grail", :Personal)

card_3 = Card.new("What is your favorite color?", "North north west", :STEM)

cards = [card_1, card_2, card_3]

deck = Deck.new(cards)

round = Round.new(deck)