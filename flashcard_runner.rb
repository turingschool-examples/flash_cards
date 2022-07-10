require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

def start(round)
    puts "Welcome! You're playing with 4 cards."
    puts "-----------------------------------------"
    while round.current_card != nil

    puts "This is card number #{round.card_index + 1} out of #{round.deck.count}."
    puts "Question: #{round.current_card.question}"
    guess = gets.chomp
    answer = round.take_turn(guess)
    puts answer.feedback
    end
    puts "****** Game over! ******"
    puts "You had #{round.number_correct} out of #{round.deck.count} for a total score of #{round.percent_correct.round(1)}."
    puts "Geography - #{round.percent_correct_by_category(:Geography)}"
    puts "STEM - #{round.percent_correct_by_category(:STEM)}"
end
def main
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
start(round)
end
main



