require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

card_1 = Card.new("What is 5 + 5", "10", :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", "Tiger", :People)
card_3 = Card.new("What is Mike's middle name?", "nobody knows", :People)
card_4 = Card.new("What cardboard cutout lives at Turing?","Justin Bieber", :Turing_Staff)

cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)

round = Round.new(deck)

puts "Welcome! You're playing with #{deck.cards.count} Cards."
puts "------------------------------------------------------"

deck.cards.each_with_index do |card, index|
    puts "This is card #{index + 1} of #{deck.cards.count}"
    puts "Question: #{card.question}"
    guess = gets.chomp
    turn = round.take_turn(guess)
    puts turn.feedback
end

puts "Game Over"
puts "You got #{round.number_correct} correct out of #{deck.cards.count} for a total score of #{round.percent_correct.to_i}%"