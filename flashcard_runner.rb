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
# new_turn = round.take_turn()

puts "Welcome! You're playing with #{cards.count} cards."
40.times {print "-"}
puts
p "This is card #{round.turns.count+1} out of #{cards.count+1}"
p "#{card_1.question}"
card_answer = gets.chomp
if card_answer.capitalize == card_1.answer
  p "Correct!"
else
  p "Incorrect!"
end
