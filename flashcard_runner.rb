card_1 = Card.new("What is 5 + 5?", "10", :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", "nobody knows", :TuringStaff)
card_3 = Card.new("What is Mike's middle name?", "nobody knows", :TuringStaff)
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :PopCulture)
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)
