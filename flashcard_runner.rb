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
round_2 = Round.new(deck)

def start(round)
  puts welcome_message(round.deck.count)

  round.deck.cards.each do |card|
    puts turn_message(round)
    user_guess(round)
    puts round.turns.last.feedback
  end
end

def welcome_message(count)
  "Welcome! You're playing with #{count} cards.
  -------------------------------------------------"
end

def user_guess(round)
  guess = gets.chomp
  round.take_turn(guess)

end

def turn_message(round)
  "This is card number #{round.turns.length + 1} out of #{round.deck.count}.
  Question: #{round.current_card.question}"
end

start(round)
