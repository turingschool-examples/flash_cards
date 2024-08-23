class Round
    attr_reader :deck, :cards 

    def initialize(deck)
        @deck = deck
        @cards = cards
    end

    def turns
        @deck = []
    end

    def current_card
        @deck.cards[0]
    end

    # while @deck.cards.empty? == false do

    # end
end

# def take_turn(guess)
#     new_turn = Tnrn.new(guess,@deck.cards[@turns.count])
#     @turns << new_turn
#     new_turn
# end

# turns.length = 0 (turns.length should go up one every turn)


