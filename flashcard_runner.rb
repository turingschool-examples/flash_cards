require './lib/card'
require './lib/turn'
require './lib/round'
require './lib/deck'
require './lib/card_generator'

file_name = "cards.txt"
cards = CardGenerator.new(file_name).cards

deck = Deck.new(cards)
round = Round.new(deck)

puts "Welcome! You're playing with #{deck.count} cards."
puts "-" * 37

def start(round)
  round.deck.cards.each do |i|
    puts "This is card number #{round.turn_num} of #{round.deck.count}"
    puts "Question: #{i.question}"
    answer = gets.chomp
    my_turn = round.take_turn(answer)
    puts my_turn.feedback
  end

  puts "****** Game Over! ******"
  puts "You had #{round.number_correct} out of #{round.deck.count} for a total score of #{round.percent_correct.to_i}%"

  included_categories = []
  round.deck.cards.each do |i|
    if included_categories.include?(i.category) == false
      puts "#{i.category} - #{round.percent_correct_by_category(i.category).to_i}% correct"
      included_categories << i.category
    end
  end
end

start(round)
