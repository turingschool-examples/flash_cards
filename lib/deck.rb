class Deck
    attr_reader :cards, :count

    def initialize(cards)
        @cards = cards
        @count = @cards.length
    end

    def cards_in_category(input_category)
        return_array = []
        count = 0
        @count.times do |index|
            if @cards[index].category == input_category
                return_array.push(@cards[index])
            end
        end
        return return_array
    end

end
