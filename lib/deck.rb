class Deck
    attr_reader :cards
    
    def initialize
        @cards = []
    end
    # not sure if this is the right way to set up this Class.
    def add_card(card)
        Card.new.shift
    end
end
