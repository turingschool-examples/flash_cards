require './lib/round'
# Math Cards
card_1 = Card.fabricate('What is 1 + 1?', '2', :Math)
card_2 = Card.fabricate('What is 50 + 20?', '70', :Math)
card_3 = Card.fabricate('What is 9 - 9?', '0', :Math)
card_4 = Card.fabricate('What is 6 + 6?', '12', :Math)
card_5 = Card.fabricate('What is the square root of -1?', 'i', :Math)

# Science Cards
card_6 = Card.fabricate('What is earths gravity?', '9.8', :Science)
card_7 = Card.fabricate('Who came up with the Theory of Special Relativity?', 'Albert Einstein', :Science)
card_8 = Card.fabricate('What is the boiling point of water?', '212F', :Science)
card_9 = Card.fabricate('Are sharks mammals?', 'No', :Science)
card_10 = Card.fabricate('Is the earth flat?', 'No', :Science)

# Geography Cards
card_11 = Card.fabricate('What is the capital of Alaska?', 'Juneau', :Geography)
card_12 = Card.fabricate('What is Earths largest contenent?', 'Asia', :Geography)
card_13 = Card.fabricate('What is the driest place on earth?', 'McMurdo, Antarctica', :Geography)

cards = [card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8, card_9, card_10, card_11, card_12, card_13]

deck = Deck.new(cards)
round = Round.new(deck)
puts ''
puts ''
puts ''
puts "Welcome! You're playing with #{round.deck.count} cards."
puts "Flash Cards Game by Jackson Valdez"
puts ''
puts ''
puts ''

until round.current_card_index == round.deck.count
  puts '-------------------------------------------------'
  puts "This is card #{round.current_card_index + 1} out of #{round.deck.count}"
  puts "Question: #{round.current_card.question}"
  print ' > '
  user_answer = gets.chomp
  turn = round.take_turn(user_answer)
  puts turn.feedback
end

puts '-------------------------------------------------'
puts ''
puts '****** Game Over!! ******'
puts ''
puts "YOUR SCORE - #{round.number_correct}/#{round.turns.length} (#{round.percent_correct}%)"
puts ''
puts "MATH - #{round.percent_correct_by_category(:Math)}%"
puts "SCIENCE - #{round.percent_correct_by_category(:Science)}%"
puts "GEOGRAPHY - #{round.percent_correct_by_category(:Geography)}%"
puts ''
puts '-------------------------------------------------'
