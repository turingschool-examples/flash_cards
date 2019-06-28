require './lib/deck'
require './lib/card'
require './lib/turn'
require './lib/round'
require './lib/card_generator'
require 'pry'

# card_1 = Card.new("What is 5 + 5", "10", :STEM)
# card_2 = Card.new("What is Rachel's favorite animal?", "dog", :"Turing Staff")
# card_3 = Card.new("What is Mike's Middle Name?", "nobody knows", :"Turing Staff")
# card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :"Pop Culture")
# card_5 = Card.new("Who is the best pug ever?", "Larry", :"Pugs")
# card_6   = Card.new("Which planet is red?", "Mars", :"STEM")
# deck = Deck.new([card_1, card_2, card_3, card_4, card_5, card_6])

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
