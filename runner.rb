require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'


  @card_1 = Card.new("What is the capital of Colorado?", "Denver", "Geography")
  @card_2 = Card.new("What is the capital of Canada?", "Ottawa", "Geography")
  @card_3 = Card.new("What is the capital of Texas?", "Austin", "Geography")
  @card_4 = Card.new("What color is the top stripe on the US flag?", "red", "History")
  @card_5 = Card.new("Who did we purchase the Louisiana Territory from?", "France", "History")
  @cards = [@card_1, @card_2, @card_3, @card_4, @card_5]
  @deck = Deck.new(@cards)
  @round = Round.new(@deck)

  #Game starts here
  puts "Welcome! You are playing with #{@deck.cards.count} cards."
  puts "----------------------------------------------------"
  puts "This is card number #{(@round.turns.count + 1)} of #{@cards.count}."
  puts "Question: #{@card_1.question?}"
  guess = gets.chomp
  @round.take_turn(guess)
