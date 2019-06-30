require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require './lib/card_generator'
require 'pry'

user_questions = "./lib/cards.txt"
new_generator = CardGenerator.new(user_questions)
generated_user_cards = new_generator.cards

deck = Deck.new(generated_user_cards)
round_1 = Round.new(deck)
all_categories = []

generated_user_cards.select{|card| all_categories << card.category}
@uniq_categories = all_categories.uniq

def start(round)
  total_cards = round.deck.cards.count
  puts "Welcome!, You're playing with #{total_cards} cards!"
  puts "-" * 50
      round.deck.cards.each do |card|
        card_number = (round.deck.cards.index(card)) + 1
        puts "This is card #{card_number} out of #{total_cards}."
        puts "Question: #{card.question}"
        user_input = gets.chomp.downcase
        round.take_turn(user_input)
        puts round.turns.last.feedback
      end

  puts "******* Game Over! *******"
  puts "You had #{round.number_correct} correct guesses out of #{total_cards} for a total score of #{round.percent_correct}%."
  @uniq_categories.each do |category|
    p "#{category} - #{round.percent_correct_by_category(category)}% correct!"
    end
end

start(round_1)
