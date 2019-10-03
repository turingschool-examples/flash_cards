require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

@card1 = Card.new("What is the capital of South Dakota?", "Pierre", :Capitals)
@card2 = Card.new("What is 5 + 4 * 3", "17", :Math)
@card3 = Card.new("What is the capital of Poland?", "Warsaw", :Capitals)

@cards = [@card1, @card2, @card3]

@deck = Deck.new(@cards)

@round = Round.new(@deck)

def start
  puts "Welcome! You're playing with #{@deck.count} cards."
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  until 
end

start
