class Round
    attr_reader :deck,
                :turns

    def initialize(deck)
        @deck=deck
        @turns=[]
    end

    def current_card
        @deck.cards[@turns.count]
    end

    def take_turn(guess)
        new_turn = Turn.new(guess,@deck.cards[@turns.count])
        @turns << new_turn
        new_turn


      
    end

end