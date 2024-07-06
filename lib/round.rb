class Round
    
    attr_reader :deck,
                :turns

    def initialize(deck)
        @deck = deck
        @turns = []
    end

    def current_card
        # @cards.select {|cards| cards.first }
        @deck.cards.fetch(0)
        # @deck.first
        # cards.each
        # @cards.select.with_index
    end
end