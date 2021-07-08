card_1 = Card.new("What is 1+1?", "2", :Math)
card_2 = Card.new("When is it ok to divide by 0?", "Never.", :Math)
card_3 = Card.new("Did the last living T'Rex live closer to the moonlanding or the last living Stegasaurus?", "The moonlanding", :Dinosaurs)
card_4 = Card.new("What is the spikey bit on the end of Stegasaurus' tail called?", "Thagomizer", :Dinosaurs)
deck_1 = Deck.new[card_1, card_2, card_3, card_4]
round_1 = Round.new(deck_1)


greeting =
