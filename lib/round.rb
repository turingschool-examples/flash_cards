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
            @correct_counter += 1.0
        end

        return new_turn
    end

    def number_correct
        @correct_counter
    end

    def number_correct_by_category(category)
        num_correct = 0.0
        total_in_category = 0.0
        @turns.each do |turn|
            if turn.card.category == category
                total_in_category += 1
            end
            if turn.card.category == category && turn.correct?
                num_correct += 1.0
            end      
        end

        return [num_correct, total_in_category]
    end

    def percent_correct
        #divide the number_correct by the turns_taken
        # @correct_counter / .count * 100.0
        @correct_counter / @turns.count.to_f * 100.0
    end

    def percent_correct_by_category(category)
        # number correct by category divided by the turns_taken in a category
        # require 'pry'; binding.pry
        
        var_1 = number_correct_by_category(category)
        var_1[0]/var_1[1] * 100
       end
end