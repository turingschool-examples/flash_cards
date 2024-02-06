class Round
    attr_reader :deck, :turns, :number_correct

    def initialize(deck)
        @deck = deck
        @turns = []
        @number_correct = 0
    end

    def current_card
        @deck.cards[0]
    end

    def take_turn(guess)
        current_turn = Turn.new(guess, current_card)
        puts current_turn.feedback
        @turns << current_turn
        if current_turn.correct?
            @number_correct += 1
        else
        end
        @deck.cards.rotate!
        current_turn
    end

    def number_correct_by_category(category)
        @turns.count { |turn| turn.card.category == category && turn.correct?}
    end

    def percent_correct
        ((@number_correct.to_f / @turns.count) * 100).round(2)    
    end

    def percent_correct_by_category(category)
        category_correct = @turns.count { |turn| turn.card.category == category && turn.correct?}
        category_count = @turns.count { |turn| turn.card.category == category}
        ((category_correct.to_f / category_count) * 100).round(2)
    end

    def start
        puts "Welcome! You're playing with #{deck.count} cards."
        puts "-------------------------------------"

        deck.cards.each do 
            puts "This is card number #{turns.count+1} out of #{deck.count}"
            puts "Question: #{current_card.question}"
            
            guess = gets.chomp
            take_turn(guess)
        end
    end

    def summary
        puts "***** Game over! *****"
    
        puts "You had #{number_correct} correct guesses out of #{deck.count} for a total score of #{percent_correct}%."
        category_array = []
        turns.each do |turn|
            category = turn.card.category
            category_array << category
        end
        category_array.uniq.each do |category|
            puts "#{category} - #{percent_correct_by_category(category)}% correct"
        end
    end
end
