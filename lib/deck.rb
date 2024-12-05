class Deck
    attr_reader :cards, :categories, :count

    def initialize(cards)
        @cards = cards
        @categories = []
        @count = cards.size

        @cards.each do |card| #Create a list of all categories in the deck
            if !@categories.include?(card.category)
                @categories << card.category
            end
        end
    end

    def cards_in_category(category)
        category_cards = []

        @cards.find_all{|card| card.category == category}
    end
end