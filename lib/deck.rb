class Deck
    attr_reader :cards

    def initialize(cards)
        @cards = cards
    end

    def count
        @cards.length
    end

    def cards_in_category(category)
        # card_list = []
        # @cards.each {|card|
        #     if card.category == category
        #         card_list << card
        #     end}
        # card_list
        @cards.select {|card| card.category == category}
    end
end