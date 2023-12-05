require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'


        @card_1 = Card.new("What is 5 + 5?", "10", :STEM)
        @card_2 = Card.new("What is Rachel's favorite animal?", "beaver", :Turing_Staff)
        @card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing_Staff)
        @card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Pop_Culture)
        @cards = [@card_1, @card_2, @card_3, @card_4]
        @deck = Deck.new([@card_1, @card_2, @card_3, @card_4])
        @round = Round.new(@deck)
        # @deck = deck.cards_in_category
        cards_total = @deck.cards.count
        counter = 1


        puts "Welcome! You're playing with #{cards_total} cards."
        puts "-------------------------"

        cards_total.times do
            puts " This is card number #{counter} out of #{cards_total}.
            Question: #{@round.current_card.question}"
            guess = gets.chomp 
            

          turn =  @round.take_turn(guess)
          puts turn.feedback
        end
       
        
    def individual_category_count
        individual_category = []
        @cards.each do |card|
        
        
    individual_category << card.category
        end 
        individual_category.uniq!
    end
    
    puts "you had #{@round.number_correct} guesses out of #{cards_total} for a total score of #{@round.percent_correct}"
individual_category_count.each do |category|
    puts "#{category} - #{@round.percent_correct_by_category(category)}% correct"
    end

        #guesses correct percentage
        #guesses correct percentage by category

        
            
      #count number of cards for total
      #account for how many categories
      #for each card do total, this is card #, question, guess, counter and feedback
      
      
      
      
      
      
      
        # def start
        #     puts "Welcome! You're playing with #{@deck.cards.count} cards."
        #     puts "-------------------------"
        #     puts "This is card number #{@card_counter} out of #{@deck.cards.count}."
        #     puts "Question: What is 5 + 5?"

        #     answer = gets.chomp.to_i
        #     if answer == 10
        #       puts "Correct!"
        #       @correct_counter += 1
        #     else puts  "Nope, sorry!"
        #         @card_counter += 1
        #     end    
            #.each method on cards array in deck
            # creates put statement "this is card x out of x"
            #puts question on card 

    #         puts "This is card number #{@card_counter} out of #{@deck.cards.count}."
    #         puts "Question: What is Rachel's favorite animal?"
    #         answer = gets.chomp

    #     if answer == "lion" || "Lion"
    #         puts "Correct!"
    #         @correct_counter += 1
    #         else puts  "Nope, sorry!"
    #             @card_counter += 1
    #         end

    #         puts "This is card number #{@card_counter} out of #{@deck.cards.count}."
    #         puts "Question: What is Mike's middle name?"
    #         answer = gets.chomp

    #     if answer == "no one knows." || "No one knows." || "no one knows"
    #         puts "Correct!"
    #         @correct_counter += 1
    #         else puts  "Nope, sorry!"
    #             @card_counter += 1
    #         end


    #     puts "This is card number #{@card_counter} out of #{@deck.cards.count}."
    #     puts "Question: What cardboard cutout lives at Turing?"
    #     answer = gets.chomp

    #     if answer == "Justin Bieber" || "justin bieber"
    #         puts "Correct!"
    #         @correct_counter += 1
    #     else puts "Nope, sorry"
    #         @card_counter += 1
    #     end
        

    # #Justin Bieber




    #     end




        

    #     start
    