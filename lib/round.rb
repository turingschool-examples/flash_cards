class Round
    attr_accessor :deck
    def initialize(deck)
        @deck = deck
        @turn 

    end

    def current_card
        @deck[0]
    end
    
    def take_turn(guess)
        @turn = Turn.new(guess, @deck[0])
    end

    def turns 
        @turn
    end
end