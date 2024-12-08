class Deck
     attr_reader :cards
    def initialize(cards)
        @cards = cards
        cards = []
    end
    
    def add_card
    @cards[] << Card.new(question, answer, category)
    end
end