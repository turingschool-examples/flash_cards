require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/card_generator'


filename = "cards.txt"
cards = CardGenerator.new(filename).cards
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
