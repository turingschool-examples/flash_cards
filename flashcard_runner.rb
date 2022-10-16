require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("What is 5 + 5", "10", :Mathematics)
cards_1 = [card_1, card_2, card_3]
deck_1 = Deck.new(cards_1)

def start(deck)
  puts "Welcome! You're playing with 3 cards."
  puts "-------------------------------------------------"
  round = Round.new(deck)
  number = 1
  number_of_cards = deck.count

    round.deck.cards.each do |card|
        puts "This is card number #{number} out of #{number_of_cards}"
        puts "Question: #{card.question}"
        answer = gets.chomp
        turn = round.take_turn(answer)
        number += 1
        puts turn.feedback
    end
  puts "****** Game Over! ******"
  puts "you had #{round.number_correct} correct out of #{number_of_cards} for a total score of #{round.percent_correct}"
  puts "Geography - #{round.percent_correct_by_category(:Geography)}%"
  puts "STEM - #{round.percent_correct_by_category(:STEM)}%"
  puts "Mathematics - #{round.percent_correct_by_category(:Mathematics)}%"
  
end
start(deck_1)
 