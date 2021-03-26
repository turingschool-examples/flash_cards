require './lib/round'
require './lib/deck'
require './lib/card'
require './lib/turn'
require './lib/card_generator'

cards = CardGenerator.new('./cards.txt').cards

categories = []

cards.each do |card|
  categories << card.category
end

categories = categories.uniq

deck = Deck.new(cards)
round = Round.new(deck)

puts "Welcome! You're playing with #{deck.count} cards."
puts "-------------------------------------------------"

card_number = 1

until card_number > deck.count
  puts "This is card number #{card_number} out of #{deck.count}."
  puts "Question: #{round.current_card.question}"
  answer = gets.chomp

  turn = round.take_turn(answer)
  puts turn.feedback
  card_number = card_number + 1
end

puts "****** Game over! ******"
puts "You had #{round.number_correct} correct guesses out of #{deck.count} for a total score of #{round.percent_correct}%."

categories.each {|category|
  puts "#{category} -  %0.1f %%" % round.percent_correct_by_category(category)
}
