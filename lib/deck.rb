class Deck
    attr_reader :cards

    def initialize(cards)
        @cards=cards
    end

    def count
        @cards.count
    end

    def cards_in_category(cat)
        cards.filter_map do |card|
            card if card.category == cat
        end
    end
    
end