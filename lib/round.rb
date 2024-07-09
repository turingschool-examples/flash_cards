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
        num_correct = 0.0
        @turns.each do |turn|
            if turn.card.category == category && turn.correct?
                num_correct += 1.0
            end
        end
        return num_correct
    end

    def percent_correct
        #divide the number_correct by the turns_taken
        # @correct_counter / .count * 100.0
        @correct_counter / @turns.count.to_f * 100.0
        # require'pry'; binding.pry
    end

    
end