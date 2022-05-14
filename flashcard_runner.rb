require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card1 = Card.new("What Olympic sport has competitors throw a sphere as far as possible?", "Shotput", :Sports)
card2 = Card.new("How many animated movies have been nomiated for the Academy Award for Best Picture?", "3", :Movies)
card3 = Card.new("Which Disney movie was the first animated film to be nominated for the Academy Award for Best Picture?", "Beauty and the Beast", :Movies)
card4 = Card.new("What city is the capital of Germany?", "Berlin", :Geography)

cards = [card1, card2, card3, card4]

deck = Deck.new(cards)

round = Round.new(deck)

round.start
round.end
