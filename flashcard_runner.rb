
  require './lib/turn'
  require './lib/card'
  require './lib/deck'
  require './lib/round'

card_1 = Card.new("What is the magic ingredient to the krabby patty?", "it's a secret", :Bikini_bottom)
card_2 = Card.new("What color are the buses in Bikini Bottom?", "orange", :Bikini_bottom)
card_3 = Card.new("How many flags are on the moon currently?" "1", :Astronomy)
card_4 = Card.new("Should you eat food found on the ground on the street?", "No", :Street_smarts)
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)




p "Welcome! You're playing with 4 cards."
p "#{deck}"


round.start
