require './lib/deck'
require './lib/turn'
require './lib/card'
require './lib/round'

card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card4 = Card.new("Where has only snow on the earth and is north", "the north pole", :Geography)

cards = [card1, card2, card3, card4]
@deck = Deck.new(cards)
@round = Round.new(@deck)

 def start(round)
 end
p "Welcome! You're playing with #{cards.count} cards."
puts "-" * 30
cards.each_with_index do |card, index| #this is a method for enumerables that is like each but with an index
puts "this is card nummber #{index + 1} out of #{cards.count}. "
p "question: #{card.question}"
guess = gets.chomp #chomp removes the extra spaces created by gets 
turn = @round.take_turn(guess)

    if turn.correct?
        p "Correct"
        else
        p "Incorrect"
    end

    puts "-" * 30
end

p "*****Game Over*****"
num_turns = @round.turns.count
correct_turns = @round.number_correct
percentage = @round.percent_correct

p "You had #{correct_turns} correct guesses out of #{num_turns} for a total score of #{percentage}%."

p "Geography - #{@round.percent_correct_by_category(:Geography)}% correct."
p "STEM - #{@round.percent_correct_by_category(:STEM)}% correct."

