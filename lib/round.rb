class Round
    attr_reader :deck,
                :turns,
                :number_correct                 

    def initialize(deck)
        @deck = deck
        @turns = []
        @number_correct = 0
    end

    def current_card
        @deck.cards.first
    end
   
    def take_turn(guess)
       new_turn = Turn.new(guess, current_card) 
       if new_turn.correct?
            @number_correct += 1
       end
       @turns << new_turn
       @deck.cards.shift
        new_turn
    end

    def number_correct_by_category(category)
        @turns.count do |turn|
             turn.correct? && turn.card.category == category
        end
    end

    def percent_correct
        (number_correct.to_f / @turns.count * 100).round(1)
    end   
   
    def percent_correct_by_category(category)
        (number_correct_by_category(category).to_f / @turns.count {|turn| turn.card.category == category} * 100).round(1)
    end
end


  
