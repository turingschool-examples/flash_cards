# deck.rb

class Deck

    attr_reader :deck, :cards

    def initialize(deck = [], cards)
        @deck = cards
        @cards = cards
    end

    def cards
        @deck
    end

    def count
        @deck.length
    end

end