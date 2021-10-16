require "./lib/card"
require "./lib/turn"
require "./lib/deck"
require "./lib/round"
require "./lib/card_generator"

filename = "cards.txt"
cards = CardGenerator.new(filename).cards
@deck   = Deck.new(cards)
@round  = Round.new(@deck)

def start
  puts "Welcome! You're playing with #{@deck.count} cards."
  puts "---------------------------------------------------"

  while @round.turns.length < @deck.cards.length do
    puts "This is card number #{@round.turns.length + 1} out of #{@round.deck.cards.length}."
    puts "Question: #{@round.current_card.question}"
    puts "Please enter a guess:"
    @round.take_turn(gets.chomp)
    puts @round.turns.last.feedback
  end

  puts "****** Game over! ******"
  category
  puts "You had #{@round.number_correct} correct guesses out of #{@round.deck.cards.length} for a total score of #{@round.percent_correct.to_i}%."
end

def category
  categories = []
  @deck.cards.each do |card|
    categories << card.category
  end
    categories.uniq.each do |category|
    puts "#{category} - #{@round.percent_correct_by_category(category)}% correct"
  end
end

start
