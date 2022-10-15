class Deck
    attr_reader :cards, :initial_size

    def initialize(cards)
        @cards = cards
        @initial_size = count
    end

    def count
        @cards.length
    end

    def current_card
        @cards[0]
    end

    def change_card
        @cards.shift
    end

    def cards_in_category(category)
        @cards.select{|card| card.category == category}
    end

end
