class Deck
    attr_reader :count, :cards_in_category
    attr_accessor :cards
    # def initialize (count, cards_in_category)
    #     @count = count
    #     @cards_in_category = cards_in_category
    # end

    def initialize
        @cards = []
        @count = count
        @cards_in_category = cards_in_category
    end

    def add_cards
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @cards << card_1
        @cards << card_2
        @cards << card_3
    end

    def count
        @count = cards.count
    end
end