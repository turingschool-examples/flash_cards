require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'
#make objects /deck/round


def start

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin B", :Pop_Culture)
    cards = [card_1, card_2, card_3, card_4]
    deck = Deck.new([card_1, card_2, card_3, card_4])
    round = Round.new(deck)



    puts "Welcome! You're playing with #{cards.length} cards"

    #binding.pry

    card_number = 0
    n = cards.length
    n.times do
     puts "This is card number #{card_number += 1} out of 4 cards"
     puts "Question: #{round.current_card.question}"
     guess = gets.chomp
     round.take_turn(guess)
     puts round.turns.last.feedback
      
     #binding.pry

end

end

start

