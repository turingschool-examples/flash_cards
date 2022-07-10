class Deck
    attr_reader :cards

    def initialize(cards)
      @cards = cards
    end

    def count
      cards.count
    end

    def cards_in_category(category)
      sorted_by_category = []
      cards.select do |card|
        if card.category == category
          sorted_by_category << card
        end
    end
  end

end
