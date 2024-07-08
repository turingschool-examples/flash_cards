class Round

    attr_reader :deck, 
                :turns, 
                :current_card,
                :turn

    def initialize(deck)
        @deck=deck
        @turns=[]
        @turn=0
    end

    def current_card
        current_card = @deck.cards[@turn]
    end

    def take_turn
        

    end
end