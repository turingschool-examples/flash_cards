require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require './lib/card_generator'
require 'pry'

card_1 = Card.new("Which 1997 film stars Nicolas Cage, John Cusack, and John Malkovich?",
"con air", :MOVIES)
card_2 = Card.new("What type of galaxy is the most common in the universe?",
  "elliptical", :SCIENCE)
card_3 = Card.new("What year was Forrest Gump released?", "1994", :MOVIES)
card_4 = Card.new("How many billions of years old is the universe?", "13.8", :SCIENCE)
card_5 = Card.new("What year was the song “My Heart Will Go On” from Titanic released?",
"1997", :MOVIES)
card_6 = Card.new("How many planets are in the Solar System?", "8", :SCIENCE)

cards = [card_1, card_2, card_3, card_4, card_5, card_6]
deck = Deck.new(cards)
round_1 = Round.new(deck)

all_categories = []
cards.select{|card| all_categories << card.category}
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
      p "#{category} - #{(round.percent_correct_by_category(category)).round}% correct!"
    end
end

start(round_1)
