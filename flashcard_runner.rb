require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require 'rspec'


card_1 = Card.new("What is 5 + 5?", "10", :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", "Rat", :TuringStaff)
card_3 = Card.new("What is Mike's middle name?", "nobody knows", :TuringStaff)
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :PopCulture)
deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)   


def start(round)
  p "Welcome! You're playing with 4 cards."
  p "-------------------------------------------------"

  4.times do |x|
      p "This is card number #{x + 1} out of 4."
      p "Question: #{round.current_card.question}"
      p round.take_turn(gets.chomp).feedback
  end
  p "****** Game over! ******"
  p "STEM: #{round.percent_correct_by_category(:STEM).to_i}%"
  p "TuringStaff: #{round.percent_correct_by_category(:TuringStaff).to_i}%"
  p "PopCulture #{round.percent_correct_by_category(:PopCulture).to_i}%"
end

start(round)
