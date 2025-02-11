require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

# Assuming the classes Card, Turn, Deck, and Round are properly defined

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

cards = [card_1, card_2, card_3]
deck = Deck.new(cards)
round = Round.new(deck)


def start(round)
  puts "Welcome! You're playing with 3 cards."

    while round.current_card
    round.display_card  # Displays the first card's question
    response = gets.chomp
    turn = round.take_turn(response)
    
    if turn.correct?
        puts "Correct!"
    else
        puts "Incorrect"
    end
    round.next_card
    end
    
    puts "Game Over"
end 

start(round)  # Calling the method to start the round