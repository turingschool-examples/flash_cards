# frozen_string_literal: true

require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

def start
  filename = 'cards.txt'
  deck = CardGenerator.new(filename).cards
  round = Round.new(deck)
  round_count = round.turns.count + 1
  total_count = deck.count

  total_count.times do
    multi_line = "This is card number #{round_count} out of #{total_count}
 Question: #{round.current_card.question}"

    puts multi_line

    round.take_turn(gets.chomp)
    round_count += 1

    puts round.turns.last.feedback.to_s if round_count > 1
  end

  multi_line = "******Game Over!******
    You had #{round.number_correct} out of #{total_count} for a total score of #{round.percent_correct}%."

  puts multi_line

  categories = []
  deck.cards.each do |card|
    categories << card.category unless categories.include?(card.category)
  end

  categories.map { |category| puts "#{category} - #{round.percent_correct_by_category(category)}% correct." }
end

start
