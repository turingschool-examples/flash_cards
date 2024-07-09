class Randomize
    attr_reader :deck,
                :card_amount,
                :card_number,
                :give_number

    def initialize(deck)
        @deck = deck
        @card_amount = @deck.count
        @card_number = set_card_number(deck)
        @give_number = 0
    end

    def set_card_number(deck)
        (1..deck.count).to_a
    end
    
    def pick
        @give_number = @card_number.sample
        @card_number.delete(@give_number)
        @give_number -= 1
    end

end