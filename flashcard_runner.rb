require './lib/card.rb'
require './lib/deck'
require './lib/turn.rb'
require './lib/round.rb'

card_1 = Card.new("What is the capital of Alaska?", "juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "north north west", :STEM)
card_4 = Card.new("What is the capital of Argentina?", "buenos aires", :Geography)
card_5 = Card.new("What is the capital of Rhode Island?", "providence", :Geography)
card_6 = Card.new("Which year did The Lord of the Rings: Return of the King win Best Picture at the Academy Awards?", "2004", :Movies)
card_7 = Card.new("What is the first movie that grossed over 1 billion dollars worldwide at the box office?", "titanic", :Movies)
card_8 = Card.new("What was the first movie released in the MCU (Marvel Cinematic Universe)?", "iron man", :Movies)
cards = [card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8]
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

### TURN 2 ###
round.start_turn_2
answer_2 = gets.chomp.downcase.to_s
turn_2 = Turn.new(answer_2, card_2)
round.take_turn(answer_2)

if answer_2 == card_2.answer
  round.correct_answer
else round.incorrect_answer
end

### TURN 3 ###
round.start_turn_3
answer_3 = gets.chomp.downcase.to_s
turn_3 = Turn.new(answer_3, card_3)
round.take_turn(answer_3)

if answer_3 == card_3.answer
  round.correct_answer
else round.incorrect_answer
end

### TURN 4 ###
round.start_turn_4
answer_4 = gets.chomp.downcase.to_s
turn_4 = Turn.new(answer_4, card_4)
round.take_turn(answer_4)

if answer_4 == card_4.answer
  round.correct_answer
else round.incorrect_answer
end

### TURN 5 ###
round.start_turn_5
answer_5 = gets.chomp.downcase.to_s
turn_5 = Turn.new(answer_5, card_5)
round.take_turn(answer_5)

if answer_5 == card_5.answer
  round.correct_answer
else round.incorrect_answer
end

### TURN 6 ###
round.start_turn_6
answer_6 = gets.chomp.downcase.to_s
turn_6 = Turn.new(answer_6, card_6)
round.take_turn(answer_6)

if answer_6 == card_6.answer
  round.correct_answer
else round.incorrect_answer
end

### TURN 7 ###
round.start_turn_7
answer_7 = gets.chomp.downcase.to_s
turn_7 = Turn.new(answer_7, card_7)
round.take_turn(answer_7)

if answer_7 == card_7.answer
  round.correct_answer
else round.incorrect_answer
end

### TURN 8 ###
round.start_turn_8
answer_8 = gets.chomp.downcase.to_s
turn_8 = Turn.new(answer_8, card_8)
round.take_turn(answer_8)

if answer_8 == card_8.answer
  round.correct_answer
else round.incorrect_answer
end

### END OF GAME ###

round.end_game
