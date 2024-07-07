class Round 
    attr_reader :deck, :turns, :number_correct

    def initialize(deck)
        @deck = deck
        @turns = []
        @current_card_position = 0
        @number_correct = 0

    end

    def current_card
        @deck.cards[@current_card_position]
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        if new_turn.correct?
            @number_correct += 1
        end
        @turns << new_turn
        @current_card_position += 1
        new_turn
    end

    

    def number_correct_by_category(category)
        @turns.count { |turn| turn.correct? && turn.card.category == category }
      end
   

    def percent_correct
        (@turns.count { |turn| turn.correct? }.to_f / @turns.size) * 100
    end

    def percent_correct_by_category(category)
        category_turns = @turns.select { |turn| turn.card.category == category }
        return 0 if category_turns.empty?
        (category_turns.count { |turn| turn.correct? }.to_f / category_turns.size) * 100
    end
end 