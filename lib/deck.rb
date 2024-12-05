#deck.rb - define the Deck class

class Deck
    attr_reader :cards

    def initialize(card_array)
        # Tracks all cards in the deck as an array of card objects
        @cards = card_array
        
    end

    #Add other methods here

end