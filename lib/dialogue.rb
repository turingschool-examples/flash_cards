require './lib/card'
require './lib/turn'
require './lib/deck'
require "./lib/round"

def welcome(num)
  puts "Welcome! You're playing with #{num} cards."
  puts "-------------------------------------------------"
end

def card_dialogue(total_cards, cards_left)
  puts "This is card number #{(total_cards - cards_left) + 1} out of #{total_cards}."
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

def game_over
  puts "****** Game over! ******"
end

def display_score(category, round)
  puts "#{category} - #{round.percent_correct_by_category(category)}% correct"
end

def display_percentages(round)
  categories = []
  round.turns.each do |turn|
    categories << turn.card.category
  end
  categories.uniq.each do |category|
    display_score(category, round)
  end
end
