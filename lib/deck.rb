
class Deck
    attr_reader :cards

    def initialize(cards)
        @cards = cards
    end

    def identify_category(category)
        @cards.select do |card|
        card.category == category
        end
    end
end