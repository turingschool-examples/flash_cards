require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/card_generator'

# card_1 = Card.new("Who is Joe's fave?", "Hanna", :Joe)
# card_2 = Card.new("What is sylvie's nickname?", "egg", :Sylvie)
# card_3 = Card.new("What does Loki like best?", "food", :Loki)
# card_4 = Card.new("In 700 BC what was the capital of Assyria ", "Ninevah", :AncientGeography)

filename = "cards.txt"
cards = CardGenerator.new(filename).txt_to_cards

# cards = [card_1, card_2, card_3, card_4]
# require "pry"; binding.pry
deck = Deck.new(cards)
round = Round.new(deck)

def start(cards, deck, round)
  card_number = 1

  puts "Welcome! You're playing with #{deck.count} cards"
  puts "-------------------------------------------------"

  deck.count.times do
    puts "This is card number #{card_number} out of #{deck.count + round.turns.length}"
    card_number += 1
    puts "Question: #{deck.cards[0].question}"
    player_guess = gets.chomp
    new_turn = round.take_turn(player_guess)
    puts "#{new_turn.feedback}"
  end

  puts "****** Game over! ******"
  puts "You had #{round.number_correct} correct guesses out of #{deck.count + round.turns.length} for a total score of #{round.percent_correct.to_i}%"

  round.categories_list.each do |cat|
    puts "#{cat} - #{round.percent_correct_by_category(cat).to_i}% correct"
  end
end

start(cards, deck, round)
