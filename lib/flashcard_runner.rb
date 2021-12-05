require './deck'
require './card'
require './turn'
require './round'


card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
deck = Deck.new([card_1, card_2, card_3])
round = Round.new(deck)

p "Welcome! You're playing with 3 cards."
p "-" * 40
round.start
p "Round #{round.turns.count + 1} of 3"
p "#{round.deck.cards[0].question}"
round.take_turn(gets.chomp)
p round.turns[0].feedback

p "Round #{round.turns.count + 1} of #{round.deck.count + round.turns.count}"
p "#{round.deck.cards[0].question}"
round.take_turn(gets.chomp)
p round.turns[0].feedback

p "Round #{round.turns.count + 1} of #{round.deck.count + round.turns.count}"
p "#{round.deck.cards[0].question}"
round.take_turn(gets.chomp)
p round.turns[0].feedback
