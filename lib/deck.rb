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

    #Optional methods not presently used
    
    def number_cards_in_category(category_to_match)
        #Return the number of cards in the list and provide a total number of cards matching the category_to_match parameter
        #Optional method not required, but could be handy
        total = 0
    
        @cards.each do |card|
            if card.category == category_to_match
                total += 1
            end
        end
    
        return total
    end
    
    def add_card(single_card)
        #Add a single card to the card list
        @cards << single_card
    end

end