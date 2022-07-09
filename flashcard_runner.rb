require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

@card_1 = Card.new("True or False: Broccoli, cabbage, and brussel sprouts are all the same species?", "True", :Biology)
@card_2 = Card.new("What is the common name of Canis lupus familiaris?", "Dog", :Biology)
@card_3 = Card.new("What element has the atomic number of 1?", "Hydrogen", :Chemistry)
@card_4 = Card.new("What is the only metal that is liquid at room temperature?", "Mercury", :Chemistry)
@card_5 = Card.new("What star is closest to the Sun?", "Proxima Centauri", :Astronomy)
@card_6 = Card.new('Which planet is generally known as the "Morning Star"?', "Venus", :Astronomy)

@deck_1 = Deck.new([@card_1, @card_2, @card_3, @card_4, @card_5, @card_6])
