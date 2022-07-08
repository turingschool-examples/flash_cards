class Deck
    attr_reader :cards, :card_categories
    def initialize(cards)
        @cards = cards
        # @card_categories = []
    end

    def count
        @cards.count
    end

    def cards_in_category(category)
        @cards.select { |card| card.category == (category) }
    end

    # def listing_card_categories
    #     cards_processed = 0
    #     until cards_processed == count
    #         @card_categories << cards[cards_processed].category
    #         cards_processed += 1
    #     end
    #     @card_categories.uniq!
    # end

end