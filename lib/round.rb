class Round
    attr_reader :deck, :turns, :current_card, :card_index

    def initialize(deck) 
        @deck = deck
        @turns = []
        @card_index = 0
    end

    def current_card
        @deck.cards[@card_index]
    end

    def take_turn(guess)
        turn = Turn.new(guess, current_card)
        @turns << turn
        @card_index += 1
        turn
    end

    def number_correct
        number_correct = 0
        @turns.each do |turn|
            if turn.correct?
                then number_correct += 1
            end
        end
    number_correct
    end

    def number_correct_by_category(category)
        correct_by_category = 0
        @turns.each do |turn|
            if turn.card.category == category && turn.correct?
                then correct_by_category += 1
            end
           
        end
        correct_by_category
        
    end

    def percent_correct
        number_correct.to_f / turns.length * 100
    end

    def percent_correct_by_category(category)
        number_correct_by_category(category) / @deck.cards_in_category(category).length * 100
    end

end
