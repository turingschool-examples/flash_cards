
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

@deck = Deck.new(@cards)
@round = Round.new(@deck)

class Game

  attr_reader :round

  def initialize (round)
    @round = round
  end
end

#Create some Cards
#Put those card into a Deck
#Create a new Round using the Deck you created
#Start the round using a new method called start

#use your existing pieces to store and manage all the necessary data.

#Welcome! You're playing with 4 cards.


# Game
counter = 1
@round.deck.count.times do
    puts " "
    puts "Card #{counter}: #{round.current_card.question}"
    guess = gets.chomp
    new_turn = @round.take_turn(guess)
    puts new_turn.feedback
    counter += 1
end