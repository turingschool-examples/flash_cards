require './card.rb'
require './turn.rb'
require './deck.rb'
require './round.rb'

card_1 = Card.new("What is 5 + 5?", 10, :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", "orangutan", :Turing_Staff)
card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing_Staff)
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Pop_Culture)

cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)

def start(deck)
    round = Round.new(deck)
    puts "Welcome! You're playing with #{deck.count} cards."
    puts "-------------------------------------------------"
    deck.count.times do
        p "This is card number #{round.turns.size + 1} out of #{deck.count}."
        puts round.current_card
        round.take_turn("10")

    end
end

start(deck)


