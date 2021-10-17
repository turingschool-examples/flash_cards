require 'rspec'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

def start
  card_1 = Card.new("What is 5 + 5?", "10", "STEM")
  card_2 = Card.new("What is Rachel's favorite animal?", "Cat", "Turing Staff")
  card_3 = Card.new("What is Mike's middle name?", "nobody knows", "Turing Staff")
  card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", "Pop Culture")
  # card_5 = Card.new("What is 2 + 2", "4", :STEM)
  cards = [card_1, card_2, card_3, card_4]
  deck = Deck.new(cards)
  round = Round.new(deck)

  puts "Welcome! You're playing with #{cards.count} cards."
  puts "-" * 43

  until round.turns.length == 4
    puts "Question: #{cards[0].question}"
    guess = gets.chomp
    round.take_turn(guess)
    puts round.turns.last.feedback
  end

  round.number_correct_by_category(:STEM)
  round.number_correct_by_category(:Turing_Staff)
  round.number_correct_by_category(:Pop_Culture)
  round.percent_correct
  puts "****** Game over! *******"
  puts "You have #{round.number_correct} correct out of #{round.turns.count} for a total score of #{round.percent_correct.round}%."
  puts "STEM - #{round.percent_correct_by_category("STEM")}%"
  puts "Turing Staff - #{round.percent_correct_by_category("Turing Staff")}%"
  puts "Pop Culture - #{round.percent_correct_by_category("Pop Culture")}%"
end
start
