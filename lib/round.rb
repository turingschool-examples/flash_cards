class Round
    attr_reader :deck, :turns, :number_of_rounds, :number_correct, :correct_by_category
    def initialize(deck)
        @deck = deck
        @turns = []
        @number_of_rounds = 0
        @number_correct = 0
        @correct_by_category = []
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

    def populate_correct_by_category
        correct_by_category = []
        turns.each do |turn|
            if turn.correct? == true
                correct_by_category << "correct #{turn.card.category}"
            else
                correct_by_category << "incorrect #{turn.card.category}"
            end
        end
    end

    def number_correct_by_category

    end
end
