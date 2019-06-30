require './lib/deck'
require './lib/card'
require './lib/turn'
require './lib/round'
require './lib/card_generator'
require 'pry'

deck = CardGenerator.new("cards.txt").cards
round_1 = Round.new(deck)
categories = []

  def start(round, deck)
    puts "Welcome! You're playing with #{deck.count} cards!"
    puts "-------------------------------------------------"

    round.deck.each do |card|
      card_number = deck.index(card)+ 1
    puts "This is card number #{card_number} out of #{deck.count}."
    puts "Question: #{card.question}"
    print "> "
    guess = gets.chomp

    round.take_turn(guess)

    puts round.turns.last.feedback

    card_number += 1
  end
end

start(round_1, deck)

puts "******** GAME OVER ********"
puts "You had #{round_1.number_correct} correct answers out of #{deck.count} for a total score of #{round_1.percent_correct}%!"

round_1.deck.uniq {|card| categories << card.category}

categories.uniq.each do |category|
  puts "#{category} - #{round_1.percent_correct_category(category)}% correct"
end
