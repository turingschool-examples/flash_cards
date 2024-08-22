class Deck
    attr_reader :deck

    def initialize(deck)
        @deck = deck
    end

    def cards_in_category(category_request)
        @deck.map do |card|
            in_category = []
            card.category == category_request ? in_category << card : nil

            # require 'pry'; binding.pry
        end.compact
    end

end
