require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the name of my cat?", "Mabel", :Pets)
card_2 = Card.new("What type of beer is sour and made with coriander and salt?", "Gose", :Beer)
card_3 = Card.new("What is the name of a type of climbing hold that is big and easy to grip?", "Jug", :Climbing)
card_4 = Card.new("What was the name of my childhood puppy?", "Cera", :Pets)
card_5 = Card.new("What is the name of a type of climbing hold that is tiny and sharp?", "Crimp", :Climbing)
card_6 = Card.new("What type of beer comes from the Cologne region of Germany?", "Kolsch", :Beer)
cards = [card_1, card_2, card_3, card_4, card_5, card_6]
deck = Deck.new(cards)
round = Round.new(deck)
@number_correct = 0
@pets_number_correct = 0
@climbing_number_correct = 0
@beer_number_correct = 0

puts "Welcome! You're playing with #{cards.count} cards."
40.times {print "-"}
puts
p "This is card #{round.turns.count+1} out of #{cards.count}"
p "#{card_1.question}"
card_answer = gets.chomp
if card_answer.capitalize == card_1.answer then @number_correct += 1 && @pets_number_correct += 1
  p "Correct!"
else
  p "Incorrect! The correct answer is #{card_1.answer}"
end

new_turn = round.take_turn("Juneau")
p "This is card #{round.turns.count+1} out of #{cards.count+1}"
p "#{card_2.question}"
card_answer = gets.chomp
  if card_answer.capitalize == card_2.answer then @number_correct += 1 && @beer_number_correct += 1
    p "Correct!"
  else
    p "Incorrect! The correct answer is #{card_2.answer}"
  end

new_turn = round.take_turn("Juneau")
p "This is card #{round.turns.count+1} out of #{cards.count+2}"
p "#{card_3.question}"
card_answer = gets.chomp
if card_answer.capitalize == card_3.answer then @number_correct += 1 && @climbing_number_correct += 1
  p "Correct!"
else
  p "Incorrect! The correct answer is #{card_3.answer}"
end

new_turn = round.take_turn("Juneau")
p "This is card #{round.turns.count+1} out of #{cards.count+3}"
p "#{card_4.question}"
card_answer = gets.chomp
if card_answer.capitalize == card_4.answer then @number_correct += 1 && @pets_number_correct += 1
  p "Correct!"
else
  p "Incorrect! The correct answer is #{card_4.answer}"
end

new_turn = round.take_turn("Juneau")
p "This is card #{round.turns.count+1} out of #{cards.count+4}"
p "#{card_5.question}"
card_answer = gets.chomp
if card_answer.capitalize == card_5.answer then @number_correct += 1 && @climbing_number_correct += 1
  p "Correct!"
else
  p "Incorrect! The correct answer is #{card_5.answer}"
end

new_turn = round.take_turn("Juneau")
p "This is card #{round.turns.count+1} out of #{cards.count+5}"
p "#{card_6.question}"
card_answer = gets.chomp
if card_answer.capitalize == card_6.answer then @number_correct += 1 && @beer_number_correct += 1
  p "Correct!"
else
  p "Incorrect! The correct answer is #{card_6.answer}"
end
print
def take_turn(guess)
  turn = Turn.new(guess, @deck.cards.shift)
  @number_correct = 0
  @turns << turn
    if turn.correct?
      @number_correct += 1
    end
  return turn
end
p "****** Game over! ******"
def percent_correct
  @number_correct.to_f / 6 * 100
end

def number_correct_by_category(category)
  # count the number of turns in the round that were correct and whose cards's category is of the desired category
  count = 0
  @turns.each do |turn|
    if (turn.correct? && turn.card.category == category) then
      count += 1
    end
    return count
  end
end
def pets_percent
  @pets_number_correct.to_f / 2 * 100
end

def beer_percent
  @beer_number_correct.to_f / 2 * 100
end

def climbing_percent
  @climbing_number_correct.to_f / 2 * 100
end

p "You had #{@number_correct} correct guesses out of 6 for a total score of #{percent_correct.round(1)}%."
p "Pets - #{pets_percent.round(1)}% correct."
p "Climbing - #{climbing_percent.round(1)}% correct."
p "Beer - #{beer_percent.round(1)}% correct."
