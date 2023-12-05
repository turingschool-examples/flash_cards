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
        correctcount = @turns.count do |turn| turn.correct? end
        percentage_correct = (correctcount.to_f / @turns.length) * 100
        percentage_correct
    end
    def percent_correct_by_category(category)
        correct_countbyC = @turns.count do |turn| 
            turn.card.category == category && turn.correct? end
            percentage_correctbyC = (correct_countbyC.to_f / turns.length) *100
            percentage_correctbyC
        
    end
end