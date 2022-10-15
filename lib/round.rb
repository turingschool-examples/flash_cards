class Round
    attr_reader :deck, :turns, :number_correct, :feedback

    def initialize(deck)
        @deck = deck
        @turns = []
        @number_correct = 0
        @feedback
    end

    def current_card
        @deck.current_card
    end

    def take_turn(guess, card = current_card)
        #this method does too many things, create helper methods
        turn = Turn.new(guess, card)
        @number_correct += 1 if turn.correct?
        @feedback = turn.feedback
        @turns << turn
        deck.change_card
        turn
    end

    def number_correct_by_category(category)
        #refactor
        category_score = 0
        turns.each do |turn| 
            if turn.correct? && turn.card.category == category
                category_score += 1
            end
        end
        category_score
    end

    def percent_correct
        @number_correct.fdiv(@turns.length).round(3) * 100.0
    end

    def percent_correct_by_category(category)
        number_correct_by_category(category).fdiv(@deck.category_data[category].length).round(3) * 100.0
    end

end
