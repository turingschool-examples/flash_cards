#deck.rb - define the Deck class

class Deck
    attr_reader :cards

    def initialize(card_array)
        # Tracks all cards in the deck as an array of card objects
        @cards = card_array
        
    end

    def count()
        cards.length()
        #Alternate: cards.count(), though this one can do other things too...
    end

    def cards_in_category(category_to_match)
        #Return array (sub-array) of card objects which have category equal to category_to_match
        card_sublist = []
    
        @cards.each do |card|
            if card.category == category_to_match
                card_sublist << card
            end
        end
    
        return card_sublist
    end

end