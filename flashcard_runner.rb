class Flashcard_runner
  require './lib/turn'
  require './lib/card'
  require './lib/deck'
  require './lib/round'

card_1 = "What is the magic ingredient to the krabby patty?", "it's a secret", :Bikini_bottom
card_2 = "What color are the buses in Bikini Bottom?", "orange", :Bikini_bottom
card_3 = "How many flags are on the moon currently?" "1", :Astronomy
card_4 = "Should you eat food found on the ground on the street?", "No", :Street_smarts
deck = [card_1, card_2, card_3, card_4]

p "Welcome! You're playing with 4 cards."
p "#{deck}"

def start





end
