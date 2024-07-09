require './card'
require './turn'
require './deck'
require './round'

card_1 = Card.new("What is 5 + 5?", 10, :STEM)
card_2 = Card.new("What is Rachel's favorite animal?","Coral", :Turing_Staff)
card_3 = Card.new("What is Mike's middle name?","nobody knows", :Turing_Staff)
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Pop_Culture)
deck = Deck.new([card_1, card_2, card_3, card_4])

def start(deck)
    round = Round.new(deck)
    puts "Welceme! You're playing with #{deck.count} cards"
    puts "-------------------------------------------------"
    deck.count.times do
        puts "This is card number #{round.turns.count + 1} out of #{deck.count}."
        p round.current_card
        round.take_turn(10)
    end    
end

start(deck)



#start the round using the start method
#print the welcome
#print the question from card one
#get input from user (10)
#responds with Correct!

#puts this is card number 2 of 4
#puts the question