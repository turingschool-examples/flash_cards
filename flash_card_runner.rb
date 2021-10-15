require './lib/round'
# Math cards
cards = []
cards.push(Card.fabricate(1, 2, :Math)) #This is not a valid card so it will not be included in the deck
cards.push(Card.fabricate('What is 1000 + 1000?', '2000', :Math))
cards.push(Card.fabricate('What is 9 - 9?', '0', :Math))
cards.push(Card.fabricate('What is 6 + 6?', '12', :Math))
cards.push(Card.fabricate('What is the square root of -1?', 'i', :Math))

# Science Cards
cards.push(Card.fabricate('What is earths gravity?', '9.8', :Science))
cards.push(Card.fabricate('Who came up with the Theory of Special Relativity?', 'Albert Einstein', :Science))
cards.push(Card.fabricate('What is the boiling point of water?', '212F', :Science))
cards.push(Card.fabricate('Are sharks mammals?', 'No', :Science))
cards.push(Card.fabricate('Is the earth flat?', 'No', :Science))

# Geography Cards
cards.push(Card.fabricate('What is the capital of Alaska?', 'Juneau', :Geography))
cards.push(Card.fabricate('What is Earths largest contenent?', 'Asia', :Geography))
cards.push(Card.fabricate('What is the driest place on earth?', 'McMurdo, Antarctica', :Geography))

valid_cards = cards.find_all do |card|
  card.class == Card
end

deck = Deck.new(valid_cards)
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
  user_answer = gets.chomp.to_s # to_s Converts all user inputs to a string
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
