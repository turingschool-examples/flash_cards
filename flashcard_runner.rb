require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
deck = Deck.new([card_1, card_2, card_3])
round = Round.new(deck)

def start(round)
    # require 'pry'; binding.pry
    cards_in_deck = 0
    current_card = -1

    puts "Welcome! You're playing with #{round.deck.count} cards."
    puts "--------------------------------------------------"

    round.deck.cards.each do |card|
        puts "This is question #{cards_in_deck += 1} out of #{round.deck.count}."
        puts "Question: #{round.deck.cards[current_card += 1].question}"

        guess = gets.chomp
        new_turn = round.take_turn(guess)
        # require 'pry'; binding.pry
        puts new_turn.feedback
    end 

    puts "****** Game Over! ******"
    puts "You had #{} correct guesses out of #{round.deck.count} for a total score of #{}%."
end

puts start(round)
