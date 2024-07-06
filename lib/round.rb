require './lib/deck'
require './lib/turn'

class Round
    attr_reader :turns, 
                :turn,
                :take_turn,
                :cards,
                :current_card,
                :deck,
                :number_correct,
                :number_correct_by_category,
                :percent_correct,
                :percent_correct_by_category
    
    
    def initialize(deck)
        @deck = deck
        @turns = []
        @current_card = @deck.cards[0]
        @turn = turn
        @number_correct = 0
        @number_correct_by_category = 0

    end
    
    def take_turn(user_guess)
        if user_guess.class != String
            "Your guess must be a string"
        else 
            @turn = Turn.new(user_guess, @current_card)
            @turns.push(turn)
            @deck.cards.rotate!
            @current_card = @deck.cards[0]
            @turn
        end
    end

    def number_correct

    end

    def number_correct_by_category(category)

    end

    def percent_correct

    end

    def percent_correct_by_category(category)

    end
end