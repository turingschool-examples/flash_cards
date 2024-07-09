class Round
    attr_reader :deck, :turns

    def initialize(deck)
        @deck = deck
        @turns = []
        @card_index = 0
        @correct_counter = 0.0
    end

    def current_card
        card = @deck.cards[@card_index]
        return card  
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns.push(new_turn)
        @deck.cards.shift
        if new_turn.correct?
            @correct_counter += 1   
        end
        return new_turn
    end

    def number_correct
       @correct_counter  
    end

    def number_correct_by_category(category)
        numbers_correct = 0
        @turns.each do |turn|
            if turn.card.category == category && turn.correct?
                numbers_correct += 1
            end
        end
        numbers_correct
    end

    def percent_correct
        @correct_counter / @turns.length.to_f * 100
    end

    def percent_correct_by_category(category)
        
    end
end