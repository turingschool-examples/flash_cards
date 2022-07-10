class Round
    attr_reader :deck,
                :turns

    def initialize(deck, turns = [])
        @deck = deck
        @turns = turns
        @current_card_index = 0
    end

    def current_card
        @deck.cards[@current_card_index]
    end

    def take_turn(guess)
        card = current_card
        @current_card_index += 1
        new_turn = Turn.new(guess, card)
        @turns << new_turn
        return new_turn
    end

    def number_correct
        @turns.count do |turn|
            turn.correct?
        end
    end

    def percent_correct
        number_correct.to_f / (turns.count.to_f) * 100
    end

    def count_response_by_category(category)
        correct = 0.0
        incorrect = 0.0

        @turns.each do |turn|
            if turn.card.category == category
                if turn.correct?
                        correct += 1
                else incorrect += 1
                end
            end 
        end
        return [correct, incorrect]       
    end



    def number_correct_by_category(category)
        self.count_number_by_category(category)[0]
    end

    def percent_correct_by_category(category)
        correct, incorrect = self.count_number_by_category(category)
        return correct / (correct + incorrect) * 100
    end
end