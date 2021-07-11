require './lib/round'

card_1 = Card.new("What is 5 + 5?", "10", :Math)
card_2 = Card.new("What is Rachel's favorite animal?", "Dog", :Turing_staff)
card_3 = Card.new("What is Mike's middle name?", "Nobody knows", :Turing_staff)
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Pop_culture)

cards = [card_1, card_2, card_3, card_4]

deck = Deck.new(cards)
