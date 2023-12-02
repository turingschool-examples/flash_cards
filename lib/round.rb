class Round
    attr_reader :deck, :turns 

    def initialize(deck)
        @deck = deck 
        @turns = []
        @card_change = 0
    end 

    def current_card 
        @deck.cards[@card_change] 
    end 

    def take_turn(guess) 
        take_turn = Turn.new(guess, current_card) 
        update_current_card
        @turns << take_turn 
        @turns [-1]
    end

    def number_correct
        @turns.count do |turn|
            turn.correct?
        end 
    end

    def number_correct_by_category(category)
        @turns.count do |turn|
            turn.card.category == category && turn.correct?
                
        end 
    end 

    def update_current_card 
        @card_change += 1 
    end 

    def percent_correct 
        ((number_correct.to_f / @turns.count.to_f) * 100).round(1)  
    end 
    
    def num_turns_by_category(category)
        @turns.count do |turn|
            turn.card.category == category 
        end 
    end 
    
    def percent_correct_by_category(category) 
        ((number_correct_by_category(category).to_f / num_turns_by_category(category).to_f) * 100).round(1)
    end 

end 