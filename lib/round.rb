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

    def number_correct_by_category(category)
        correct_answers_by_category = []
        turns.category.each do |turn|
            if turn.correct? == true
                correct_answers_by_category << turn.correct?
            end
        end
        correct_answers_by_category.count
    end

end