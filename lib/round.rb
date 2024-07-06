require './lib/deck'
require './lib/turn'

class Round
    attr_reader :deck,
                :turns, 
                :current_card
    
    def initialize(deck)
        @deck = deck
        @turns = []
        @current_card = @deck.cards[0]
    end
    
    def take_turn(user_guess)
        if user_guess.class != String
            "Your guess must be a string"
        else 
            @turn = Turn.new(user_guess, @current_card)
        end
    end
end