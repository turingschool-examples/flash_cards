class Round
    
    attr_reader :deck,
                :turns,
                :guess,
                :card

    attr_accessor :turns,
                  :card,
                  :deck

    def initialize(deck)
        @deck = deck
        @turns = []
    end

    def current_card
        @deck.cards.first
    end

    def take_turn
        @card = current_card

        @turns << card
        #require 'pry'; binding.pry
        @deck.cards.shift

    end

end