require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

filename = "cards.txt"
cards = CardGenerator.new(filename).cards
deck = Deck.new(cards)
round = Round.new(deck)

def start(round)
  puts "Welcome! You're playing with #{round.deck.cards.length} cards."
  puts "-" * 50
  while round.turns.length < round.deck.cards.length
    puts "This is card number #{round.turns.length + 1} out of #{round.deck.cards.length}."
    puts "Question: #{round.current_card.question}"
    guess = gets.chomp
    round.take_turn(guess)
    p round.turns.last.feedback
  end
  gameover(round)
end

def gameover(round)
  puts "****** Game over! ******"
  puts "You had #{round.number_correct} correct guesses out of #{round.deck.cards.length} for a total score of #{round.percent_correct.to_i}%"
  categories = []
  round.turns.each do |turn|
    categories << turn.card.category unless categories.include?(turn.card.category)
  end
  categories.each do |category|
    puts "#{category} - #{round.percent_correct_by_category(category).to_i}% correct"
  end
end

start(round)
