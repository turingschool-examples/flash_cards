class Round
    attr_reader :active_deck,
                :turns

    def initialize (active_deck)
        @active_deck = active_deck
        @turns = []
    end

    def current_card
        active_deck.cards[0]
    end

end