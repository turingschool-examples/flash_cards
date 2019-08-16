# require 'pry'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What percent of the universe is dark matter?", "27", :STEM)
card_2 = Card.new("Which United States President was the only one to serve two non-consecutive terms?", "Grover Cleveland", :HISTORY)
card_3 = Card.new("Rounded to the nearest ten, approximately how many bones is a human born with?", "270", :HEALTH)
card_4 = Card.new("Who was the clinical doctor who developed the hormonal birth control pill?", "John Rock", :HISTORY)
card_5 = Card.new("What area of psychology incorporates the body?", "Somatic Psychology", :HEALTH)
card_deck = [card_1, card_2, card_3, card_4, card_5]
start_deck = Deck.new(card_deck)
round1 = Round.new(start_deck)

def start(round)
  puts "Welcome! You're playing with #{ total_cards = round.deck.count } cards."
  puts "---------------------------------------------------------------"
  round.deck.cards.each do |card| # with time, refactor so the original card deck size can be called from either round or deck.rb
    puts "This is card number #{ round.turns.length + 1 } out of #{ total_cards }."
    puts "Question: #{ round.current_card.question }"
    puts round.take_turn(gets.chomp).feedback
  end
end

start(round1)
