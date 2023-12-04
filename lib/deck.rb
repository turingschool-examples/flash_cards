class Deck
    attr_reader :cards
    
    def initialize(*card_objects)
        @card_objects = card_objects
    end