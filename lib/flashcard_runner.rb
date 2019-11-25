require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'io/console'

@card1 = Card.new("What is the powerhouse of the cell?", "Mitochondria", :STEM)
@card2 = Card.new("How many sweat glands does the average foot have?", "250000", :STEM)
@card3 = Card.new("How many original pokemon are there?", "151", :Video_Games)
@card4 = Card.new("Who are the winners of the 2019 World Series?", "Washington Nationals", :Sports)

# require "pry"; binding.pry

#put cards in a deck
@cards = [@card1, @card2, @card3, @card4]
@deck = Deck.new(@cards)
#put deck in a round
@round = Round.new(@deck)
#print prompt for user by using the length of the turn variable to display the card number out of 4

#get chomp the guess
puts "Welcome! You're playing with 4 cards."

puts "-" * 50

# require "pry"; binding.pry
puts "This is card number #{@round.card_counter} out of 4."

@round.continue

puts "Question: #{@card1.question}"
# tie it to a turn
#determine whether is is correct
#show whether it is correct (feedback)
#repeat

# then do all the breakdowns by category and such
