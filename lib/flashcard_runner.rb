require './lib/card.rb'
require './lib/deck.rb'
require './lib/turn.rb'
require './lib/round.rb'

card_1 = Card.new("How long did it take me to write this code?", "Forever", :Joey)
card_2 = Card.new("What color is the sky?", "Blue", :Earth)
card_3 = Card.new("How many continents are there?", "7", :Earth)
card_4 = Card.new("What state do i live in", "California", :Joey)

@cards = [card_1, card_2, card_3, card_4]
@deck = Deck.new(@cards) 
@round = Round.new(@deck)
 


def start 
    card_total = @deck.cards.count
    card_num = 1 
    puts "Welcome! You're playing with #{card_total} cards." 
    puts "-------------------------------------------------"

    card_total.times  do 
        puts "This is card number #{card_num} out of #{card_total}
        Question: #{@round.current_card.question}"
        
        guess = gets.chomp 
        puts @round.take_turn(guess).feedback 
        @round.take_turn(guess)
        card_num += 1 
    end 
end 
start 



