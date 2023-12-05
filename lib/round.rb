class Round
    attr_reader :deck, :turns, :number_correct
    def initialize(deck)
        @deck = deck
        @turns = []
        @number_correct = 0
    end

    def current_card
        # require 'pry' ; binding.pry
        deck.cards.first
    end

    def take_turn(guess)
        turn = Turn.new(guess, current_card)
        @turns.push turn
        if turn.correct?
            @number_correct += 1 
        end
        deck.cards.delete(current_card)
        @deck = Deck.new(deck.cards)
        return turn
    end
    
    def number_correct_by_category(category)
        amount_correct = 0
        turns.each do |turn|
            if turn.card.category == category
                if turn.correct?
                    amount_correct += 1
                end
            end
        end
        
        amount_correct
    end
    
    def percent_correct
        (number_correct.to_f / turns.length) * 100
    end
    
    def percent_correct_by_category(category)
        category_cards = []
        turns.each do |turn|
            if turn.card.category == category
                category_cards.push(turn)
            end
        end

        (number_correct_by_category(category).to_f / category_cards.length) * 100
        # require 'pry' ; binding.pry
            
    end

end