require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

# card_1 = Card.new("What is the capital of Togo?", "Lome", :Geography)
# card_2 = Card.new("The _______ Trench is the deepest point on Earth.", "Mariana", :Geography)
# card_3 = Card.new("What year did the Titanic sink?", "1912", :History)
# card_4 = Card.new("Salvador _______ is a Spanish surrealist painter.", "Dali", :Art)
# card_5 = Card.new("Who painted 'La Guernica'?", "Picasso", :Art)
# card_6 = Card.new("The Count of Monte Cristo is set in which country?", "France", :Literature)
# card_7 = Card.new("What does the Spanish word 'embarazada' mean?", "Pregnant", :Languages)
# card_8 = Card.new("What county is Centennial, CO in?", "Arapahoe", :Geography)
# deck = Deck.new([card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8])
# round = Round.new(deck)

cards = CardGenerator.new("cards2.txt").cards
deck_it4 = Deck.new(cards)
round = Round.new(deck_it4)

round.start
