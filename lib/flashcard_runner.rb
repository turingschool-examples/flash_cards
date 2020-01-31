require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card1 = Card.new("What country has the most natural lakes?", "Canada", :Geography)
card2 = Card.new("What is the only sea without any coasts?", "Sargasso Sea", :Geography)
card3 = Card.new("What is Michael Bluth's son's name in the television show, Arrested Development?", "George Michael", :Pop_Culture)
card4 = Card.new("Who plays Moira Rose in the television show, Schitt's Creek?", "Catherine O'Hara", :Pop_Culture)

cards = [card1, card2, card3, card4]
new_deck = Deck.new(cards)
new_round = Round.new(new_deck)

puts "Welcome! You're playing with #{cards.length} cards."
