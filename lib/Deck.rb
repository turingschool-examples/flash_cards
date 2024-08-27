class Deck
    attr_reader :card, :counts

    def initialize(card, count)
        @count = count
        @card = card
    end

    def count
        @card.count
    end

    def cards_in_category(catagory)
        @card.select {|card| card.caregory == catagory}
    end
end