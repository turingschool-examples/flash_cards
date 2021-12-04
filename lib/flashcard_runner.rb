require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

cards = [card_1, card_2, card_3]
deck = Deck.new(cards)
round = Round.new(deck)

until deck.cards.empty? do
  puts "Welcome, you're playing with #{deck.size} cards"
  puts "This is card #{round.count} out of #{deck.size + round.count}"
  puts '---------------------------------'
  puts  "Question: #{round.question}"
  print 'Answer: '
  guess = gets.chomp
  turn = round.take_turn(guess)
  puts turn.feedback
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
