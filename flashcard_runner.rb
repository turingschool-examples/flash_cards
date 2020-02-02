require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What substance taken in when growing gives onions their distinct smell?", "sulphur","Fruit and Vegetable")
card_2 = Card.new("What is the first name of the man on the Pringles can?", "julius","Snack Foods")
card_3 = Card.new("Immersing food in vinegar to prolong its lifespan is known as what?", "pickling","Cooking Methods")
card_4 = Card.new("Cooking foods under high heat in the oven is refered to as what?", "broiling","Cooking Methods")
card_5 = Card.new("In what country did the orange originate?", "china","Fruit and Vegetable")
card_6 = Card.new("What is the best selling cookie in the United States?", "oreo","Snack Foods")
card_7 = Card.new("At sea level what is the boiling point of water in fahrenheit?", "212","Cooking Methods")
card_8 = Card.new("The cooking method in which food is cooked in a sealed bag at a low temperature is know as what?", "sous-vide","Cooking Methods")
card_9 = Card.new("On which continent did broccoli originate?", "europe","Fruit and Vegetable")
card_10 = Card.new("What brand is known for the slogan 'Betcha Can't Eat Just One'?", "lay's","Snack Foods")


cards = [card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8, card_9, card_10]

deck = Deck.new(cards)
round = Round.new(deck)

round.start
