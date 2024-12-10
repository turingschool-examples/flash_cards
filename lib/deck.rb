class Deck
    attr_reader :cards 
    attr_accessor :cards
   
    def initialize(cards)
        @cards = cards
    end

    def count
        @count = cards.count
    end

end