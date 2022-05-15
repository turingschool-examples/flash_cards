require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'


card_1 = Card.new("What is 5 + 5?", "10", :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", "tarantula", :"Turing Staff")
card_3 = Card.new("What is Mike's middle name?", "nobody knows", :"Turing Staff")
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :"Pop Culture")

deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)
# card_count = round.deck.count
# puts round.deck.count
# puts card_count
def start(round)
  this_round = round
  turn_number = 0
  current_card = round.current_card()
  answer = ""
  # require 'pry'; binding.pry
  puts "Welcome! You're playing with #{this_round.deck.count} cards."
  puts "-----------------------------------------------------------"

  while turn_number < this_round.deck.count do
    puts "This is card number #{turn_number + 1} out of #{this_round.deck.count}"
    puts "Question: #{this_round.current_card.question}"
    answer = gets.chomp
    turn = round.take_turn(answer)
    turn_number += 1
    puts turn.feedback
  end

  if turn_number == this_round.deck.count
    #Game Over logic
    puts "****** Game over! ******"
    puts "You had #{round.number_correct} out of #{this_round.deck.count} for a total score of #{this_round.percent_correct.to_i}%"
    puts round.number_correct_by_category(:"Turing Staff")
    puts "STEM - #{this_round.percent_correct_by_category(:STEM).to_i}%"
    puts "Turing Staff - #{this_round.percent_correct_by_category(:"Turing Staff").to_i}%"
    puts "Pop Culture - #{this_round.percent_correct_by_category(:"Pop Culture").to_i}%"
  end
end

start(round)
