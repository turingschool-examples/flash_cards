require './lib/deck'
require './lib/card'
require './lib/turn'
require './lib/round'
require 'pry'

card_1 = Card.new("What is 5 + 5", "10", :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", "dog", :"Turing Staff")
card_3 = Card.new("What is Mike's Middle Name", "nobody knows", :"Turing Staff")
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :"Pop Culture")
deck = Deck.new([card_1, card_2, card_3, card_4])
round_1 = Round.new(deck)


  def start(round, deck)
    puts "Welcome! You're playing with #{deck.cards.count} cards!"
    puts "-------------------------------------------------"

    round.deck.cards.each do |card|
      card_number = deck.cards.index(card)+ 1
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
puts "You had #{round_1.number_correct} correct answers out of #{deck.cards.count} for a total score of #{round_1.percent_correct}%!"
puts "STEM - #{round_1.percent_correct_category(:STEM)}% correct"
puts "Turing Staff - #{round_1.percent_correct_category(:"Turing Staff")}% correct"
puts "Pop Culture - #{round_1.percent_correct_category(:"Pop Culture")}% correct"
