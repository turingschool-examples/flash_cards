require './lib/card'
require './lib/turn'
require './lib/deck'
require 'pry'

#question, answer, category
card_1 = Card.new("How fast does the Earth spin? (in MPH)", 1000, :STEM)
card_2 = Card.new("In music, what does BPM stand for?", "Beats per miute", :Music)
card_3 = Card.new("What company made the first car?", "Mercedes-Benz", :Auto)
card_4 = Card.new("What animal does a horse and a donkey produce?", "Mule", :Bio)

cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)

# binding.pry

# Create some Cards
# Put those card into a Deck
# Create a new Round using the Deck you created
# Start the round using a new method called start

puts "Welcome! You're playing with #{deck.count} cards."

puts "This is card number #{card_number} out of 4.
Question: What is 5 + 5?"

puts card.question

gets turn.guess
