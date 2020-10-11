require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("What is both difficult, and also, a riddle?", "That's riddle is stupid", :Trivia)
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)
count = round.deck.cards.count


puts "Welcome! You're playing with #{deck.count} cards."
puts "-------------------------------------------------------------"
cards.each do |card|
  puts "This is card number #{round.turns.count + 1} out of #{deck.cards.count}"
  puts "Question: #{card.question}"
  new_turn = round.take_turn(gets.chomp)
  puts round.turns.last.feedback
  end
  puts "****** Game over! ******"
  puts "You had #{@correct} correct guessess out of #{deck.count} for a total score of #{round.percent_correct}%"
  @num = 0
  round.unique_category_singular.each do |card|

    puts "#{round.unique_category_singular.uniq[@num]} - #{round.percent_correct_by_category(card)}% correct"
    @num += 1
  end
