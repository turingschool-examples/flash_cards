class Deck
    attr_reader :cards

    def initialize(cards = [])
        @cards = cards
    end

    def count
        @cards.count
    end

    def cards_in_category(category_name)
        @cards.select do |card|
            card.category == category_name
        end
    end

    def move_card_to_back
        @cards.rotate!
    end

end