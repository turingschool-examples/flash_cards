class Round
    
    attr_reader :deck,
                :turns

    def initialize(deck)
        @deck = deck
        @turns = []
    end

    def current_card
        # @cards.select {|cards| cards.first }
        # @deck.fetch(0)
        # @deck.first
        # cards.each
    end
end