# deck.rb

class Deck

    attr_reader :deck, :cards

    def initialize(deck = [], cards)
        @deck = cards
        @cards = cards
    end

    def cards
        @deck
    end

    def count
        @deck.length
    end

    def cards_in_category(category)

        count = 0
        sorted_array = []
        d_arr_len = @deck.length

        d_arr_len.times do
            
            if deck[count].category == category
                sorted_array << deck[count]
            end
            count += 1
        end

        sorted_array

    end

end