require './lib/card_generator'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

def start
  filename = './lib/cards.txt'
  cards = CardGenerator.new(filename).cards
  deck = Deck.new(cards)
  round = Round.new(deck)
  categories_all = cards.map { |card| card.category }
  categories_unique = categories_all.uniq

  puts "Welcome! You're playing with #{deck.count} cards."
  puts "-------------------------------------------------"

  while round.turns.size < deck.count
    puts "This card is #{round.turns.size + 1} out of #{deck.count}"
    puts "Question: #{round.current_card.question}"
    guess = gets.capitalize.chomp

    round.take_turn(guess)
    puts round.turns.last.feedback
  end

  puts "****** Game over! ******"
  puts "You had #{round.number_correct} correct guesses out of #{deck.count} for a total score of #{round.percent_correct}%."
  
  categories_unique.each { |category| puts "#{category} - #{round.percent_correct_by_category("#{category}")}% correct" }
end

start