class Round
    # initialized deck, turns and current_card
    attr_reader :deck, :turns, :current_card
    def initialize(deck)
        @deck = deck
        @turns = []
        # current_card is returning the first card in deck
        @current_card = deck.cards.first
    end

end