class Round
    attr_reader :deck, :turns
    def initialize(deck)
        @deck = deck
        @turns = []
        @currentcard = 0
       
    end

    def current_card
         @deck.cards[(@currentcard)]
    end

    
    def take_turn(guess)
        new_turn = Turn.new(guess,current_card)
        @turns << new_turn
        @currentcard +=1
        return new_turn
    end

    def number_correct
        numc = 0
        @turns.each do |turn|
            if turn.correct?
                numc += 1
            end
        end
        numc
    end
    def number_correct_by_category(category)
        numcbc = 0
        @turns.each do |turn|
            if turn.card.category == category && turn.correct?
                numcbc += 1
            end
        end
        numcbc
    end
    def percent_correct
        
        percentage_correct = (number_correct.to_f / @turns.length) * 100
        percentage_correct
    end
    def percent_correct_by_category(category)
        percentage_correct_by_category = (number_correct_by_category(category).to_f / turns.length) *100
        percentage_correct_by_category
        
    end
end