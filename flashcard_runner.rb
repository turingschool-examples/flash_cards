require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card1 = Card.new("What is the name of the island in Jurassic Park?", "Isla Nublar", :Movies)
card2 = Card.new("What is the name of the Beatles' final album?", "Let it Be", :Music)
card3 = Card.new("Who played the hit-man Jules in Pulp Fiction?", "Samuel L. Jackson", :Movies)
card4 = Card.new("What is the capital city of Brazil?", "Brasilia", :Geography)
card5 = Card.new("What is the smallest US State?", "Rhode Island", :Geography)
card6 = Card.new("Who wrote the 1971 hit song, What's Going On?", "Marvin Gaye", :Music)

cards = [card1, card2, card3, card4, card5, card6]

deck = Deck.new(cards)

round = Round.new(deck)

def start_game 
    puts "Welcome! You're playing with 6 cards.\n
    --------------------------------------\n
    This is card number 1 out of 6.\n
    Question: What is the name of the island in Jurassic Park?"
    gets.chomp
    if gets.chomp == "Isla Nublar"
        puts
    end
end

start_game