class Round
    attr_reader :deck,
                :turns
   

    def initialize(deck)
        @deck = deck
        @turns = []
    end

    def current_card
        #get the first card in the deck
        # require 'pry';binding.pry
        @deck.cards.first
    end
end