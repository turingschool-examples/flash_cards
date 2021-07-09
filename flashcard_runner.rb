# Create some Cards
# Put those card into a Deck
# Create a new Round using the Deck you created
# Start the round using a new method called start
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/play'

card_1 = Card.new("In Harry Potter, what class does Professor McGonagall teach?", "Transfiguration", "Harry Potter")
card_2 = Card.new("What is the name of Harry Potter's pet owl?", "Hedwig", "Harry Potter")
card_3 = Card.new("On Schitt's Creek, what kind of disgruntled animal does David act like?", "Pelican", "Schitt's Creek")
deck = Deck.new([card_1, card_2, card_3])
round = Round.new(deck)
round.start

# puts "Welcome! You're playing with 4 cards."
# puts "-------------------------------------------------"
# puts "This is card number #{round.turns.length + 1} out of #{(deck.cards.count + round.turns.length)}."
# puts "Question: #{round.current_card.question}"
# answer = gets.chomp
# round.take_turn(answer.downcase.capitalize)
# puts round.turns.last.feedback
# puts "This is card number #{round.turns.length + 1} out of #{(deck.cards.count + round.turns.length)}."
# puts "Question: #{round.current_card.question}"
# answer = gets.chomp
# round.take_turn(answer.downcase.capitalize)
# puts round.turns.last.feedback
# puts "This is card number #{round.turns.length + 1} out of #{(deck.cards.count + round.turns.length)}."
# puts "Question: #{round.current_card.question}"
# answer = gets.chomp
# round.take_turn(answer.downcase.capitalize)
# puts round.turns.last.feedback
