require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is 5 + 5?", "10", :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", "Giraffe", :Turing_Staff)
card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing_Staff)
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Pop_Culture)
deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)

puts "Welcome! You're playing with #{deck.count} cards."
puts "-" * 50

while round.deck_index < deck.count
  puts "This is card number #{round.deck_index + 1} out of #{deck.count}"
  puts "Question: #{round.current_card.question}"
  puts round.take_turn(gets.chomp).feedback

end
puts "****** Game over! ******"
puts "You had #{round.number_correct} out of #{deck.count} for a total score of #{round.percent_correct}%."
