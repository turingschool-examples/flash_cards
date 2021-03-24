require 'colorize'
require "./lib/card"
require "./lib/deck"
require "./lib/turn"
require "./lib/round"
require "./lib/card_generator"

# deck = Deck.new([
#     Card.new("In what year was the first-ever Wimbledon Championship held?", "1877", :Sports),
#     Card.new("Hg is the chemical symbol of which element?", "Mercury", :Science),
#     Card.new("Which email service is owned by Microsoft?", "Hotmail", :History),
#     Card.new("In what year were the first Air Jordan sneakers released?", "1984", :History),
#     Card.new("According to Greek mythology, who was the first woman on earth?", "Pandora", :Mythology),
#     Card.new("Who is the greek goddess of victory", "Nike", :Mythology),
#     Card.new("In which European city would you find Orly airport?", "Paris", :Geography)
# ])

card_gen = CardGenerator.new('./cards.txt')
deck = Deck.new(card_gen.cards)

round = Round.new(deck)

round.start

