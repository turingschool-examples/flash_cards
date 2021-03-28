require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

def start
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and
    reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5°
      clockwise from due north?", "North north west", :STEM)
  card_4 = Card.new("What is the capital of Morocco?", "Rabat", :Geography)
  cards = [card_1, card_2, card_3, card_4]
  deck = Deck.new(cards)
  round = Round.new(deck)
  card_counter = 1

  puts "Welcome! You're playing with #{cards.length} cards."
  puts "----------------------------------------------------"
  puts "This is card number 1 out of #{cards.length}."
  puts "Question: #{deck.cards[0].question}"
  new_turn = round.take_turn(gets.chomp)
  new_turn.feedback
  card_counter += 1


end

start
