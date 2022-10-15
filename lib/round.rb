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

    def number_correct_by_category(category_entry_check)
        matching_category_turn = []
        turns.each do |turn|
            if turn.card.category == category_entry_check
                matching_category_turn << turn
            end
        end
        # correct_category_answers = []
        #     if matching_category_turn.correct? == true
        #         correct_category_answers << matching_category_turn.correct?
        #     end
        # correct_category_answers
        
    end

end