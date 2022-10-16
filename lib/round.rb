class Round
    attr_reader :active_deck,
                :turns

    def initialize (active_deck)
        @active_deck = active_deck
        @turns = []
    end

    def current_card
        active_deck.cards[0]
    end

    def take_turn(guess)
        new_turn_instance = Turn.new(guess, active_deck.cards[0])
        turns << new_turn_instance
        
        new_turn_order = active_deck.cards.rotate(1)
        active_deck.cards.replace(new_turn_order)
        
        return new_turn_instance 
    end

    def number_correct
        correct_answers = []
        turns.each do |turn|
            
            if turn.correct? == true
                correct_answers << turn.correct?
            end

        end
        correct_answers.count
    end

    def percent_correct
       percentage = number_correct.to_f / turns.count.to_f * 100
    
        return "#{percentage}%"  
    end


    def number_correct_by_category(category_entry_check)
        matching_category_turn = []
        turns.each do |turn|
            if turn.card.category == category_entry_check
                matching_category_turn << turn
            end
        end
        matching_category_turn
        correct_category_cards = []
            
            matching_category_turn.each do |match_cat_turn|
                if match_cat_turn.correct? == true
                    correct_category_cards << match_cat_turn.correct?
                end
            end

        correct_category_cards.count  
    end

    def percent_correct_by_category(category_check)
        category_turn = []
        turns.each do |turn|
            
            if turn.card.category == category_check
                category_turn << turn
            end

        end
        percentage_cat = number_correct_by_category(category_check).to_f / category_turn.count.to_f * 100
        return "#{percentage_cat}%"
    end

#methods for playing the game from start through game over


    def start
    
        welcome = ["", "Welcome! You're playing with 4 cards.",
        "-------------------------------------------------", 
        "This is card number #{active_deck.cards[0].card_number} out of 4.", 
        "Question: #{active_deck.cards[0].question}", ""]

        puts welcome

        puts "Answer:"
        
        first_answer = gets.chomp

        take_turn(first_answer)

    end

    def turn_2

        turn2 = ["-------------------------------------------------", 
        "This is card number #{active_deck.cards[0].card_number} out of 4.", 
        "", "Question: #{active_deck.cards[0].question}", ""]

        puts turn2

        puts "Answer:"

        second_answer = gets.chomp

        take_turn(second_answer)
        
    end

    def turn_3

        turn3 = ["-------------------------------------------------", 
        "This is card number #{active_deck.cards[0].card_number} out of 4.", 
        "", "Question: #{active_deck.cards[0].question}", ""]

        puts turn3

        puts "Answer:"

        third_answer = gets.chomp

        take_turn(third_answer)

    end

    def turn_4

        turn4 = ["-------------------------------------------------", 
        "This is card number #{active_deck.cards[0].card_number} out of 4.", 
        "", "Question: #{active_deck.cards[0].question}", ""]

        puts turn4

        puts "Answer:"

        fourth_answer = gets.chomp

        take_turn(fourth_answer)

    end

    def game_over

        game_over_message = ["****** Game over! ******", "", "You had #{number_correct} correct guesses out of 4 for a total score of #{percent_correct}.",
        "US States - #{percent_correct_by_category(:US_States)}", 
        "Tongue Twisters - #{percent_correct_by_category(:tongue_twister)}","", "************************"]

        puts game_over_message

    end

end