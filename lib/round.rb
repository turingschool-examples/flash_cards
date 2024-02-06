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
        current_turn.feedback
        @turns << current_turn
        if current_turn.correct?
            @number_correct += 1
        else
        end
        # try to adjust below to reassign, rather than bang operator.
        @deck.cards.rotate!
        current_turn
    end

    def number_correct_by_category(category)
        @turns.count { |turn| turn.card.category == category && turn.correct?}
    end

    def percent_correct
        (@number_correct.to_f / @turns.count) * 100
    end

    def percent_correct_by_category(category)
        category_correct = @turns.count { |turn| turn.card.category == category && turn.correct?}
        category_count = @turns.count { |turn| turn.card.category == category}
        (category_count.to_f / category_correct) * 100
    end

    def start
        p "Welcome! You're playing with #{deck.count} cards."
        p "-------------------------------------"

        deck.cards.each do 
            p "This is card number #{turns.count+1} out of #{deck.count}"
            p "Question: #{current_card.question}"
            
            guess = gets.chomp
            take_turn(guess)
        end
    end
end
