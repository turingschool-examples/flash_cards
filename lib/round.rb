class Round
    attr_reader :deck, :turns

    def initialize(deck)
        @deck = deck
        @turns = []
        @card_index = 0
    end

    def current_card
        card = @deck.cards[@card_index]
        return card  
    end

    def take_turn(guess)

    end
end