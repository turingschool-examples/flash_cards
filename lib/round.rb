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
end