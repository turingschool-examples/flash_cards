class Round
    attr_reader :deck, 
                :turns,
                :number_correct,
                :card_count

    def initialize(deck)
        @deck = deck
        @turns = []
        @number_correct = 0
        @card_count = 1
    end
    
    def take_turn(guess)
        current_turn = Turn.new(guess, current_card)
        correct_guess(current_turn)
        p current_turn.feedback
        @turns << current_turn
        @card_count += 1
        @deck.move_card_to_back
        current_turn
    end

    def play_round
        until @card_count > @deck.count
        p "This is card number #{@card_count} out of #{@deck.count}."
        p "Question: #{current_card.question}"
        user_answer = gets.chomp
        break if user_answer == "quit"
        take_turn(user_answer)
        end
        round_over
    end

    def round_over
        p "****** Round over! ******"
        p "You had #{number_correct} correct guesses out of #{@turns.length} for a total score of #{percent_correct}%."
        p "#{current_card.category} - #{percent_correct_by_category(current_card.category)}% correct"
    end
    
    def current_card
        @deck.cards[0]
    end

    def correct_guess(turn)
        @number_correct += 1 if turn.correct?
    end

    def number_correct_by_category(category)
        @turns.count do |turn|
            turn.card.category == category && turn.correct?
        end
    end

    def percent_correct
        if @turns.length == 0
            0
        else
            (@number_correct.to_f / @turns.length * 100).round 
        end
    end

    def percent_correct_by_category(category)
        if turns_by_category(category) == 0
            0
        else
        (number_correct_by_category(category).to_f / turns_by_category(category) * 100).round
        end
    end

    def turns_by_category(category)
        @turns.count do |turn|
            turn.card.category == category
        end
    end
end