class Round
    attr_reader :deck, :turns, :number_correct 
    def initialize(deck)
        @deck = deck
        @turns = []
        @number_correct = 0
    end

    def current_card
        # if @turns == []
        #     current_card = @deck.cards[0]
        #     #binding.pry
        # elsif @turns == [1]
        #     current_card = @deck.cards[1]
        # else @turns == [2]
        #     current_card = @deck.cards[2]
        # end
        @deck.cards.first
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns << new_turn
        if new_turn.correct?
            @number_correct += 1
        end
        # new_turn.feedback
        # @turns_taken += 1
        @deck.cards.shift
        new_turn
    end

    def turn_count
        @turns.count
    end

    def number_correct_by_category(category)
        correct_by_category_count = 0
        @turns.each do |turn|
            if turn.card.category == category && turn.correct?
                correct_by_category_count += 1
            end
        end
        correct_by_category_count
    end

    def percent_correct
        (@number_correct/turn_count).to_f * 100
        #binding.pry
    end

    def percent_correct_by_category(category)
        count_by_category = 0
        @turns.each do |turn|
            if turn.card.category == category
                count_by_category += 1
            end
        end
        (number_correct_by_category(category)/count_by_category).to_f * 100
    end
end
