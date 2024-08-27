# Create some Cards

# Put those card into a Deck
# Create a new Round using the Deck you created
# Start the round using a new method called start

require './lib/card.rb'
require './lib/deck.rb'
require './lib/turn.rb'
require './lib/round.rb'

def intro
  puts "Welcome! You're playing with 4 cards."
  puts '-------------------------------------------------'
end

def load_deck
  card_1 = Card.new("What is 5 + 5?", 10, :math)
  card_2 = Card.new("What is Rachel's favorite animal?", "Turkey", :Turing)
  card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing)
  card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Turing)

deck = Deck.new([card_1, card_2, card_3, card_4])
end

def play(deck)

run_card_number = 
puts 'This is card number 1 out of 4.'
puts 'Question: What is 5 + 5?'
