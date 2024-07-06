class Deck
    attr_reader :cards, :count

    def initialize(cards)
        @cards = cards
        @count = @cards.length
    end

    # def count
    #     cards.length
    # end

    def cards_in_category(input_category)
        arr1 = []
        count = 0
        @count.times do |index|
            # puts index
            # puts @cards[index].category
            if @cards[index].category == input_category
                arr1.push(@cards[index])
            end
        end
        return arr1

        # cards.select{|category| cards.include?(category)}
        
        # else
        #     return []
        # end
    end

end
