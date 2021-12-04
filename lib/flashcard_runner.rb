require_relative './card'
require_relative './turn'
require_relative './deck'
require_relative './round'
require_relative './card_generator'


cards = CardGenerator.new('./cards.txt').cards
deck = Deck.new(cards)
round = Round.new(deck)

until deck.cards.empty? do
  system('clear')
  puts "Welcome, you're playing with #{deck.size} cards"
  puts "This is card #{round.count} out of #{deck.size + round.count}"
  puts '---------------------------------'
  puts  "Question: #{round.question}"
  print 'Answer: '
  guess = gets.chomp
  turn = round.take_turn(guess)
  puts turn.feedback
  sleep(1)
end

puts '****** Game Over! ******'
puts "You had #{round.number_correct} correct guesses out of #{deck.size + round.count} for a total score of #{round.percent_correct}%."

categories = []
round.turns.each do |turn|
  categories << turn.card.category
end
categories.uniq.each do |category|
  puts "#{category}: #{round.percent_correct_by_category(category)}% correct"
end
