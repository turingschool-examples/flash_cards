require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


    def setup 
        @card_1 = Card.new("What is 5 + 5?", "10", :Mathematics)
        @card_2 = Card.new("What is Rachel's favorite animal?", "Giraffe", "Turing Staff")
        @card_3 = Card.new("What is Mike's middle name?", "nobody knows", "Turing Staff")
        @card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", "Pop Culture")

        @deck = Deck.new([@card_1, @card_2, @card_3, @card_4])

        @round = Round.new(@deck)

        # @round.take_turn(@round.start)
    end 

    def start
        setup
        puts "Welcome! You're playing with #{@deck.cards.count} cards.\n-------------------------------------------------"
        
        tally = 0
        card_count = @deck.count 
        until @round.turns.count == @deck.count do
            puts "This is card number #{tally += 1} out of #{card_count}"
            puts "Question: #{@round.current_card.question}"
            guess = gets.chomp
            @round.take_turn(guess)
            puts @round.turns.last.feedback
        end 
        
        puts "****** Game over! ******"
        puts "You had #{@round.number_correct} correct guesses out of #{ card_count} for a total score of #{@round.percent_correct.to_i}%."
        
        @round.categories.each do |category|     
            puts  "#{category}- #{@round.percent_correct_by_category(category).to_i}% correct"
        end 
    end 

start