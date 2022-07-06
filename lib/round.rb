class Round
    attr_reader :deck, :turns, :number_of_rounds, :number_correct, :incorrect_by_category, :correct_by_category
    def initialize(deck)
        @deck = deck
        @turns = []
        @number_of_rounds = 0
        @number_correct = 0
        @correct_by_category = Hash.new
        @incorrect_by_category = Hash.new
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
            if correct_by_category[answered_card.category] == nil
                populate_correct_by_category
            else 
                correct_by_category[answered_card.category] += 1
            end
        else
            if incorrect_by_category[answered_card.category] == nil
                populate_incorrect_by_category
            else
                incorrect_by_category[answered_card.category] += 1
            end
        end

        return turn = Turn.new(guess, answered_card)
        
    end

    def percent_correct
        @number_correct / @number_of_rounds.to_f * 100
    end

    def percent_correct_by_category(category)
        correct_by_category[category] / (incorrect_by_category[category] + correct_by_category[category]).to_f * 100
    end

    def populate_correct_by_category
        correct_by_category[answered_card.category] = 1
    end

    def populate_incorrect_by_category
        incorrect_by_category[answered_card.category] = 1
    end

    def number_correct_by_category(category)
        correct_by_category[category]
    end

end
