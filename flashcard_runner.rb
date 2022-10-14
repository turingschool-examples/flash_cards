require './lib/round'
require './lib/deck'
require './lib/card'
require './lib/turn'


card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM) 
cards = [card_1, card_2, card_3]
deck = Deck.new(cards)
round = Round.new(deck)
initial_deck_size = round.deck.count
#move method to round/deck class / refactor whole process
categories = deck.cards.map {|card| card.category}.uniq
p categories

puts "Welcome! You're playing with #{initial_deck_size} cards."
puts "-------------------------------------------------"


until round.deck.count == 0 do
  puts "This is card number #{round.turns.length + 1} out of #{initial_deck_size}."
  puts "Question: #{round.current_card.question}"
  guess = gets.chomp
  round.take_turn(guess)
  puts "#{round.feedback}\n"
end

puts "****** Game over! ******"
puts "You had #{round.number_correct} correct guesses out of #{initial_deck_size} for a total score of #{round.percent_correct}."
categories.each{|category| puts "#{category.to_s} - #{round.percent_correct_by_category(category)}% correct"}
