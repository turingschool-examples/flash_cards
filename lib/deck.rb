class Deck
    attr_reader :cards, 
                :count

    def initialize(cards)
        @cards = cards
        @count = cards.length
    end

    def cards_in_category(category)
        @cards.find_all do |card|
            card.category == category
            # require 'pry'; binding.pry
        end

    end

end