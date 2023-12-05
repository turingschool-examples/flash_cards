require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

        @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @card_4 = Card.new("What is the capital of California?", "Sacramento", :Geography)
        @deck = Deck.new([@card_1, @card_2, @card_3, @card_4])
        @round = Round.new(@deck)
        @card_counter = 1

        def start
            puts "Welcome! You're playing with #{@deck.cards.count} cards."
            puts "-------------------------"
            puts "This is card number #{@card_counter} out of #{@deck.cards.count}."
            puts "Question: What is 5 + 5?"

            answer = gets.chomp.to_i
            if answer == 10
              puts "Correct!"
            else puts  "Nope, sorry!"
                @card_counter += 1
            end    

            puts "This is card number #{@card_counter} out of #{@deck.cards.count}."
            puts "Question: What is Rachel's favorite animal?"
            answer = gets.chomp

        if answer == "lion" || "Lion"
            
            puts "Correct!"
            else puts  "Nope, sorry!"
                @card_counter += 1
            end

            puts "This is card number #{@card_counter} out of #{@deck.cards.count}."
            puts "Question: What is Mike's middle name?"
            answer = gets.chomp

        if answer == "no one knows." || "No one knows." || "no one knows"
            puts "Correct!"
            else puts  "Nope, sorry!"
                @card_counter += 1
            end


        puts "This is card number #{@card_counter} out of #{@deck.cards.count}."
        puts "Question: What cardboard cutout lives at Turing?"
    answer = gets.chomp

    #Justin Bieber




        end




        

        start
    