require './lib/card'
require './lib/turn'
require './lib/deck'
require "./lib/round"

def welcome(num)
  puts "Welcome! You're playing with #{num} cards."
  puts "-------------------------------------------------"
end

def card_dialogue(total_cards, cards_left)
  puts "This is card number #{(total_cards - cards_left) + 1} out of #{total_cards}"
end

def question(round)
  puts "Question: #{round.current_card.question}"
end

def flip_card(total_cards, cards_left, round)
  card_dialogue(total_cards, cards_left)
  question(round)
  guess = gets.chomp
  round.take_turn(guess)
end
