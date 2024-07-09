class Randomize
    attr_reader :deck,
                :card_amount

    def initialize(deck)
        @deck = deck
        @card_amount = @deck.count
    end

    def pick
        @card_amount -= 1
        rand(0..@card_amount)
    end

end