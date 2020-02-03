require "./lib/card"
require "./lib/turn"
require "./lib/deck"
require "./lib/round"
require "pry"

def start
  card_1 = Card.new("In which city is Turing located?", "Denver", :Turing)
  card_2 = Card.new("Which language are we learning right now?", "Ruby", :Turing)
  card_3 = Card.new("Should baby unicorns initialize with poop rainbows instead of an empty array?", "Yes", :Aurora)
  card_4 = Card.new("What is the sum of 7 and 7?", "14", :Math)
  deck = Deck.new([card_1, card_2, card_3, card_4])
  round = Round.new(deck)

  puts "NOTE: String answers Must be capitalized at this time."
  puts "Welcome! You're playing with #{deck.count} cards."
  49.times { print "-" }
  deck.count.times do
    puts "\nThis is Card #{round.turns.count + 1} out of #{deck.count}."
    puts "Question: #{round.current_card.question}"
    round.take_turn(gets.chomp)
    print round.turns[round.turns.count - 1].feedback
  end

  puts "****** Game over! ******"
  puts "You had #{round.turns.count { |turn| turn.correct? }} correct guesses out of #{deck.count} for a total score of #{round.percent_correct.to_i}%."
  categories = []
  round.turns.each { |turn| categories << turn.card.category }
  categories.uniq!.each do |category|
    puts "#{category} - #{round.percent_correct_by_category(category).to_i}% correct."
  end
end

start
