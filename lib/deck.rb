class Deck
    attr_reader :cards, :category

    def initialize(cards)
        @cards = cards 
        @category = category
    end
    def count
        @cards.count
    end
    def cards_in_category(category)
        @cards.find_all do |card|
            card.category == category
        end
        # cards_in_cat =[]
        # @cards.each do |card|
        #     if card.category == category
        #         cards_in_cat << card
        #     end
        # end
        # cards_in_cat
    end
end