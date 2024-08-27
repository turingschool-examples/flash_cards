require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card1  = Card.new("What is Dr. Brown's specialty?", "Ultrasonography", "Personal")
card2 = Card.new("What does Dr. Reeve love?", "Poms", "Personal")
card3 = Card.new("What vein is best to place and IV catheter?", "Cephalic", "Medical")
card4 = Card.new("What species is Solensia for?", "Felines", "Medical")
card5 = Card.new("How is Leptospirosis most commonly transmitted?", "Urine", "Medical")
card6 = Card.new("What is a common anti-inflammatory for cats?", "Onsior", "Medical")
card7 = Card.new("What behavior do Natasha's favorite appointments have?", "Aggressive", "Personal")

cards = [card1, card2, card3, card4, card5, card6, card7]

deck = Deck.new(cards)

round = Round.new(deck)

round.start
