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

def start (deck, round)
  index = 1
  puts "Welcome! You're playing with #{round.deck.cards.count} cards."
  puts "-" * 40
  round.deck.cards.each do |card|
    puts "This is card number #{index} out of #{round.deck.cards.count}"
    puts "Question: #{round.current_card.question}"
    guess = gets.chomp.capitalize
    puts round.take_turn(guess).feedback
    index += 1
  end
end

start(deck, round)

puts "****** Game Over! ******"
puts "You have #{round.number_correct} correct guesses out of #{round.deck.cards.count} for a total score of #{round.percent_correct.round(2)}."
# puts "#{round.percent_correct_by_category(category[0])} - correct"
# puts "#{round.percent_correct_by_category(category[1])} - correct"
# puts "#{round.percent_correct_by_category(category[2])} - correct"
