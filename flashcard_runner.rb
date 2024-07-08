
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

@card_1 = Card.new("What is 5 + 5?", "10", :STEM)
@card_2 = Card.new("What is Rachel's favorite animal?", "panda", "Turing")
@card_3 = Card.new("What is Mike's middle name?", "nobody knows", "Turing")
@card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", "Turing")
@cards = [@card_1, @card_2, @card_3, @card_4]

@deck = Deck.new(@cards)
@round = Round.new(@deck)

class Game

  attr_reader :round

  def initialize (round)
    @round = round
  end

  def start(round)
    total_card_num = round.deck.cards.length
    count = 1

    puts "Welcome! You are playing with 4 cards."

  until @round.deck.count.times do
    puts "This is card #{count} out of #{round.total_card_num} cards."
    puts "#{round.@current_card.question}"
    guess = gets.chomp
    new_turn = @round.take_turn(guess)
    puts new_turn.feedback
    counter += 1
  end
  end

  puts "Game Over!"
  puts 
  
  # You had 3 correct guesses out of 4 for a total score of 75%.
  # STEM - 100% correct
  # Turing Staff - 50% correct
  # Pop Culture - 100% correct
end

start(round)

#Create some Cards
#Put those card into a Deck
#Create a new Round using the Deck you created
#Start the round using a new method called start

#use your existing pieces to store and manage all the necessary data.




