class Round
    attr_reader :deck, :turns
    def initialize(deck)
        @deck = deck
        @turns = []
        @currentcard = 0
    end

    def current_card
         @deck.cards[(@currentcard)]
    end
    






end