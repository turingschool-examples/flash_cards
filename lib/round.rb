class Round
    attr_reader :deck, :turns, :number_correct, :number_in_category
    # attr_accessor :number_in_category
    
    def initialize(deck)
        @deck = deck
        @turns = []
        @number_correct = 0
        @number_in_category = 0
    end

    def current_card
        # @deck.cards.first
        @deck.cards[@turns.length]
        
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns << new_turn

        if new_turn.correct?
            @number_correct += 1
        end
        # @deck.cards = @deck.cards.rotate(1)

        new_turn

    end

    def number_by_category(category)
        number_by_category = 0

        turns.each do |turn|
            if turn.card.category == category
                number_by_category += 1
            end
        end

        number_by_category
    end

    def number_correct_by_category(category)
        number_correct_in_category = 0

        turns.each do |turn|
            if turn.card.category == category && turn.correct?
                number_correct_in_category += 1
            end
        end

        number_correct_in_category
    end

    def percent_correct

        @number_correct / @turns.count.to_f * 100

    end

    # def percent_correct_by_category(category)
    #     number_in_category = 0
    #     turns.each do |turn|
    #         if turn.card.category == category
    #             number_in_category += 1
    #         end
    #         number_in_category 
    #     end
    # end

    def percent_correct_by_category(category)

        number_correct_by_category(category) / number_by_category(category).to_f * 100

    end
end