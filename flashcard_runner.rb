require './lib/card.rb'
require './lib/deck'
require './lib/turn.rb'
require './lib/round.rb'

card_1 = Card.new("What is the capital of Alaska?", "juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "north north west", :STEM)
card_4 = Card.new("What is the capital of Argentina?", "buenos aires", :Geography)
card_5 = Card.new("What is the capital of Rhode Island?", "providence", :Geography)
card_5 = Card.new("Which year did The Lord of the Rings: Return of the King win Best Picture at the Academy Awards?", "2004", :Movies)
card_6 = Card.new("What is the first movie that grossed over 1 billion dollars worldwide at the box office?", "titanic", :Movies)
card_7 = Card.new("What is the first movie released in the MCU (Marvel Cinematic Universe)?", "iron man", :Movies)
cards = [card_1, card_2, card_3, card_4, card_5, card_6, card_7]
deck = Deck.new(cards)
round = Round.new(deck)

### TURN 1 ###
round.start
answer_1 = gets.chomp.downcase.to_s
turn_1 = Turn.new(answer_1, card_1)
round.take_turn(answer_1)

if answer_1 == card_1.answer
  round.correct_answer
else round.incorrect_answer
end
