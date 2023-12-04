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
 

class StartGame 
    def initialize(deck)
        @deck = deck 
        @round = Round.new(@deck)
    end 
 
    def start 
        card_total = @deck.cards.count
        card_num = 1 
        puts "Welcome! You're playing with #{card_total} cards." 
        puts "-------------------------------------------------"

        card_total.times  do 
            puts "This is card number #{card_num} out of #{card_total}
            Question: #{@round.current_card.question}"
        
            guess = gets.chomp 
            @round.take_turn(guess)
            puts @round.turns[-1].feedback 
            card_num += 1 
        end 

        game_over
    end 

    def game_over
            #round.turns.count == card_total 
            puts "****** Game over! ******"
            puts "You had #{@round.number_correct} out of #{@deck.cards.count} for a total score of #{@round.percent_correct}% correct"
            puts "#{@round.deck.cards[0].category} - #{@round.percent_correct_by_category(:Joey)}% correct"
            puts "#{@round.deck.cards[2].category} - #{@round.percent_correct_by_category(:Earth)}% correct"
    end 
end 

start_game = StartGame.new(@deck)
start_game.start 



