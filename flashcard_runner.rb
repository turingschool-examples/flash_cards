# require "pry";binding pry

require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
deck = Deck.new([card_1, card_2, card_3])
round = Round.new(deck)

def start
  puts welcome_message
  until @deck.count == 0
    start.turn_message
    user_guess
    @card.turn.guess.feedback
  end
end

def welcome_message
  message = "Welcome! You're playing with #{@deck.count} cards.
  -------------------------------------------------"
  puts message
end

def user_guess
  @round.take_turn.new_turn = gets.chomp
  take_turn
  put @round.new_turn
end

def turn_message
  message = "This is card number #{round.current_card.index_number} out of #{deck.count}.
  Question: #{round.current_card.question}"
  puts message
  gets.chomp
end
