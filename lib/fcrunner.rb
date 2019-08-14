require './turn.rb'
require './card.rb'

card1 = Card.new("What is the capital of Alaska", "Juneau", ":Geography")
turn = Turn.new("Juneau", card1)

p turn.card
p turn.correct?
p turn.guess
turn.feedback
