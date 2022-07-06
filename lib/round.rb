class Round
    attr_reader :deck, :turns, :number_of_rounds, :number_correct
    def initialize(deck)
        @deck = deck
        @turns = []
        @number_of_rounds = 0
        @number_correct = 0
    end

    def current_card
        deck.cards.at(number_of_rounds)
    end

    def answered_card
        deck.cards.at((number_of_rounds)-1)
    end

    def take_turn(guess)
        current_turn = Turn.new(guess, current_card)
        turns << current_turn
        @number_of_rounds += 1
        if current_turn.correct? == true
            @number_correct += 1
        end
        return Turn.new(guess, answered_card)
        
    end

    def percent_correct
        @number_correct / @number_of_rounds.to_f * 100
    end

    # def percent_correct_by_category(category)
    #     correctly_answered_turns_categories = []
    #     turns.each do |turn|
    #         if card.category == card.guess
    #             correctly_answered_turns_categories << "correct #{card.category}"
    #         else
    #             correctly_answered_turns_categories << "correct #{card.category}"
    #         end
    #     end
    # end
end
