class Round
    attr_reader :deck, :turns

    def initialize(deck)
        @deck = deck
        @turns = []
       
    end
    def current_card
        card_index = @turns.count
        @deck.cards[card_index]
    end
    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns << new_turn
        new_turn
    end
    def number_correct
        correct_turns = 0
        @turns.each do |turn|
            if turn.correct? 
               correct_turns += 1
            else
                next
            end  
        end
        correct_turns
    end
    def number_correct_by_category(category)
        correct_turns = 0
        @turns.each do |turn|
            if turn.correct? && turn.card.category == category
                correct_turns += 1
            end
            
        end
        correct_turns
    end
    def percent_correct
        number_correct.to_f / @turns.count * 100.0
    end

end