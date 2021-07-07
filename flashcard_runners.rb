require "./lib/card.rb"
require "./lib/turn.rb"
require "./lib/deck.rb"
require "./lib/round.rb"

# Create some Cards
card_1 = Card.new("What is 5 + 5?", "10", :Math)
card_2 = Card.new("What is the capital of Thailand?", "Bangkok", :Geography)
card_3 = Card.new("Where is the Golden Gate Bridge?", "San Francisco", :Geography)
card_4 = Card.new("Who is the current US president?", "Joe Biden", :Politics)

# Put those cards into a Deck
deck = Deck.new([card_1, card_2, card_3, card_4])
deck.cards
deck.count

# Create a new Round using the Deck you created


# Start the round using a new method called start
#def start
  # Welcome message
  puts "Welcome! You're playing with 4 cards."
  puts "------------------------------------------------"

  # Question 1
  puts "This is card number 1 out of 4."
  puts "Question: #{card_1.question}"
  # Get a guess from a player
  puts "Please enter your guess: "
  guess = gets.chomp
  turn_1 = Turn.new("#{guess}", card_1)
  # turn_1.card_1
  # turn_1.guess
  # turn_1.correct?
  puts turn_1.feedback

  # Question 2
  puts "This is card number 2 out of 4."
  puts "Question: #{card_2.question}"
  # Get a guess from a player
  puts "Please enter your guess: "
  guess = gets.chomp.downcase
  turn_2 = Turn.new("#{guess}", card_2)
  puts turn_2.feedback

  # Question 3
  puts "This is card number 3 out of 4."
  puts "Question: #{card_3.question}"
  # Get a guess from a player
  puts "Please enter your guess: "
  guess = gets.chomp
  turn_3 = Turn.new("#{guess}", card_3)
  puts turn_3.feedback

  # Question 4
  puts "This is card number 4 out of 4."
  puts "Question: #{card_4.question}"
  # Get a guess from a player
  puts "Please enter your guess: "
  guess = gets.chomp
  turn_4 = Turn.new("#{guess}", card_4)
  puts turn_4.feedback

  require "pry"; binding.pry

  puts "***** Game Over! *****"
# You had 3 correct guesses out of 4 for a total score of 75%.
# STEM - 100% correct
# Turing Staff - 50% correct
# Pop Culture - 100% correct


#end
