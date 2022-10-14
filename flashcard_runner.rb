require 'rspec'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class Start

  card_1 = Card.new("What is 5 + 5?", "10", :STEM)
  card_2 = Card.new("What is Rachel's favorite animal?", "Giraffe", :TuringStaff)
  card_3 = Card.new("What is Mike's middle name?", "nobody knows", :TuringStaff)
  card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :PopCulture)
  deck = Deck.new([card_1, card_2, card_3, card_4])
  round = Round.new(deck)

  p "Welcome to Flashcards!"
  p "Please enter your name"
  name = gets.chomp

  p "Welcome #{name}! You're playing with #{round.deck.cards.length} cards."
  p "-------------------------------------------------"
  p "This is card number #{round.turns.size + 1} out of #{round.deck.cards.length}."
  #Start game, round one. Print card_1(1) to terminal
  puts "Question:" 

  guess = gets.chomp

  p "****** Game over! ******"
  p "You had #{round.number_correct} correct guesses out of #{round.turns.length} for a total score of #{round.percent_correct}."
  p "STEM - #{round.percent_correct_by_category(:STEM)}% correct"
  p "Turing Staff - #{round.percent_correct_by_category(:TuringStaff)}% correct"
  p "Pop Culture - #{round.percent_correct_by_category(:PopCulture)}% correct"
  
end
