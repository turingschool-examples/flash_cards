class Round

    attr_reader :deck, :turns, :number_correct, :card_counter

    def initialize (deck)
        @deck = deck
        @turns = []
        @number_correct = 0
        @card_counter = 0
    end

    def current_card      
        @deck.cards[@card_counter]
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        if new_turn.correct? == true
            @number_correct += 1
        end
        @card_counter += 1
        @turns << new_turn
        new_turn
    end

    def number_correct_by_category(category)
        sorted_array = @turns        
        length = @card_counter

        counter = 0
        number_correct = 0

        length.times do
            if sorted_array[counter].correct? && sorted_array[counter].card.category == category
                number_correct += 1
            end
            counter += 1
        end

        number_correct
    end

    def percent_correct
        number_correct = @number_correct
        count = @card_counter
        percent_correct = ((number_correct.to_f / count.to_f) * 100).round(1)
    end

    def percent_correct_by_category(category)
        cards_in_cat = @deck.cards_in_category(category).length

        number_correct = number_correct_by_category(category)
        count = cards_in_cat
        percent_correct = ((number_correct.to_f / count.to_f) * 100).round(1)
    end

    def start
        # Welcome Message
        puts " "
        puts "Welcome to Grant's Game!"
        puts "10 questions, 10 answers - how will you fare?"
        puts "---------------------------------------------"

        # Game
        counter = 1
        deck.count.times do

            puts " "
            puts "Card #{counter}: #{current_card.question}"
            guess = gets.chomp
            new_turn = take_turn(guess)
            puts new_turn.feedback
            counter += 1

        end

        # Exit & Summary
        puts " "
        puts "Game Over! Let's see how you did..."
        puts " "
        puts "Game Summary:"
        puts "-------------"
        puts "Geography - #{percent_correct_by_category(:Geography)}% correct"
        puts "Math - #{percent_correct_by_category(:Math)}% correct"
        puts "Space - #{percent_correct_by_category(:Space)}% correct"
        puts "Bonus - #{percent_correct_by_category(:Bonus)}% correct"
        puts " "
        puts "See you next time!"
        puts " "
    end

end