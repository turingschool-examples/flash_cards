# deck.rb

class Deck

    attr_reader :cards

    def initialize (cards)
        @cards = cards
    end

    def count
        @cards.count
    end

    def cards_in_category(category)
        counter = 0
        sorted_array = []

        @cards.count.times do
            if @cards[counter].category == category
                sorted_array << cards[counter]
            end
            counter += 1
        end

        sorted_array
    end

end