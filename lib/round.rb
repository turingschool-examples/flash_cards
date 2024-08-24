class Round
    attr_reader :deck, :cards, :card, :turn, :turns

    def initialize(deck)
        @deck = deck
        @turn = turn
        @turns = turns
        @card = card
        @cards = cards
    end

    def turns
        @deck = []
    end

    def current_card
        @deck.cards[0]
    end

    # while @deck.cards.empty? == false do
    # 

    # end

    def count 

    def take_turn(guess)
        new_turn = Turn.new(guess, @deck.cards[@turns.count])
        @turns << new_turn
        new_turn
    end
    
    def correct?
        new_turn = @turn
        current_card = @deck.cards[0]
        return true if new_turn[0] == current_card[1]
            false 
    end
end

    # def number_correct
        
    # end

    # # def last

    # end

    # def feedback

    # end



# def take_turn(guess)
#     new_turn = Turn.new(guess,@deck.cards[@turns.count])
#     @turns << new_turn
#     new_turn
# end

# turns.length = 0 (turns.length should go up one every turn)


# turn should pull the card and return it to the end of the array

