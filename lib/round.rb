class Round
    attr_accessor :deck :number_correct
    def initialize(deck)
        @deck = deck
        @turn = []
        @number_correct = 0

    end

    def current_card
        @deck[0]
    end
    
    def take_turn(guess)
        turn = Turn.new(guess, @deck[0])
    end

    def turns 
        @turn
    end
end