class Round
    attr_reader :deck, 
                :turns, 
                :current_card, 
                :number_correct

    def initialize(deck)
        @deck = deck
        @turns = []
        @current_card = deck.cards[0]
        @number_correct = 0
    end

    def take_turn(guess)
        turn = Turn.new(guess, @current_card)
        @turns.push(turn)
        deck.cards.shift
        @current_card = deck.cards[0]
        if turn.correct? == true
            @number_correct += 1
        end
        turn
    end

    def number_correct_by_category(category)
        category_total_correct = 0
        @turns.each do |turn|
            if category == turn.instance_variable_get(:@card).instance_variable_get(:@category) && turn.correct? == true
                category_total_correct += 1
            end
        end
        category_total_correct
    end
    
    def percent_correct
        @number_correct.to_f / @turns.count.to_f * 100
    end

    def percent_correct_by_category(category)
        category_total_correct = 0
        category_total = 0
        @turns.each do |turn|
            if category == turn.instance_variable_get(:@card).instance_variable_get(:@category) && turn.correct? == true
                category_total_correct += 1
            end
        end
        @turns.each do |turn|
            if category == turn.instance_variable_get(:@card).instance_variable_get(:@category)
                category_total += 1
            end
        end
        category_total_correct.to_f / category_total.to_f * 100
    end
end