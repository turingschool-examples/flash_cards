class Round
    attr_reader :deck
    attr_reader :turns
    attr_reader :number_correct

    def initialize(deck)
        @deck = deck
        @turns = []
        @number_correct = 0
    end

    def current_card
        deck.cards[0]
    end

    def take_turn(guess)
        turn = Turn.new(guess, current_card)

        if turn.correct?
            @number_correct += 1
        end

        @deck.cards.shift() #Removes the first element in the cards array, keeps current_card accurate

        @turns << turn
        turn
    end

    def number_correct_by_category(category)
        
        @turns.find_all {|turn| turn.correct? && turn.card.category == category}.size

    end

    def percent_correct #All percents rounded to two decimal places

        correct_turns = @turns.find_all {|turn| turn.correct?}


        ((correct_turns.size.to_f/turns.size) * 100).round(2)
    end

    def percent_correct_by_category(category)
        correct = number_correct_by_category(category).to_f #Float used to ensure percentage not rounded prematurely
        
        total_turns = @turns.find_all {|turn| turn.card.category == category}
        correct_turns = total_turns.find_all {|turn| turn.correct?}

        ((correct_turns.size.to_f/total_turns.length) * 100).round(2)
    end
end