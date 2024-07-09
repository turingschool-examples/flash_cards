class Round
    
    attr_reader :deck,
                :turns

    def initialize(deck)
        @deck = deck
        @turns = []
        @correct_guesses = 0
        @card_index = 0
        @correct_turns = []
    end

    def current_card
        @deck.cards[@card_index]
    end


    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns.push(new_turn)
        @card_index += 1
        if new_turn.correct? == true
            @correct_guesses += 1
            @correct_turns.push(new_turn)
        end
        return new_turn
    end
    
    def number_correct
        correct_guesses = @turns.count do |turn|
            turn if turn.correct? == true
        end
        return @correct_guesses
    end

    def number_correct_by_category(category)
        correct_by_category = 0
        @correct_turns.each do |turn|
           if turn.card.category == category
            correct_by_category += 1
           end
        end
        # puts correct_by_category
        return correct_by_category
    end

    def percent_correct
        @correct_guesses.to_f / @turns.count.to_f * 100
    end

    def turn_by_category(category)
        turn_by_category = @turns.find_all do |turn|
            turn.card.category == category
        end
        turn_by_category
    end

    def percent_correct_by_category(category)
        correct_by_category = 0
        @correct_turns.each do |turn|
           if turn.card.category == category
            correct_by_category += 1
           end
        end
        return correct_by_category.to_f / turn_by_category(category).count.to_f * 100
        
    end
end