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
        
        return new_turn_instance
        
    end

    def number_correct
        correct_answers = []
        turns.each do |turn|
            correct_answers << turn.correct?
        end
        correct_answers.count
    end

end