require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What are acceptable reasons for discharge or transfer?", "Medical reasons", :CLIENT)
card_2 = Card.new("Patients have the right to be free from restraints unless what is obtained?", "Authorized order", :CLIENT)
card_3 = Card.new("the ability to understand the feelings of another without pitying them", "Empathy", :COMMUNICATION)
card_4 = Card.new("The “Resident’s Bill of Rights” was put out by which group?", "AHA", "Ethical Behavior")
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)


total_cards = round.turns.count + cards.count
total_rounds = round.deck.cards + round.turns

cats = round.deck.cards.map do |card|
  card.category
end.uniq



puts "Welcome! You're playing with #{total_cards} cards."
puts '-' * 51

num = 0
total_rounds.each do |card|
  puts "This card is number #{num += 1} out of #{total_cards}"
  puts "Question: #{card.question}"
  user_answer = gets.chomp
  guess = round.take_turn(user_answer)
  puts guess.feedback
end

puts "****** Game Over! ******"
puts "You had #{round.correct} correct guesses out of #{total_cards} for a total score of #{(round.percent_correct).to_i}%"
cats.each do |cat|
  puts "#{cat} - #{(round.percent_correct_by_category(cat)).to_i}%"
end
