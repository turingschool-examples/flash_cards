#Deck class stores all cards for current round

class Deck
    attr_reader :deck

    def initialize(cards)
        @deck = cards
    end

    def cards_in_category(category_request)

        category = []
        category = deck.map do |card|

            in_category = []
            card.category == category_request ? in_category << card : nil
            
        end.compact
        

    end

    def guessed
        @deck.shift
    end

end
