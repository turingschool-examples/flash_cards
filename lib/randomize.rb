class Randomize
    attr_reader :deck,
                :card_amount,
                :card_number,
                :give_number

    def initialize(d_count)
        @card_number = set_card_number(d_count)
        @give_number = 0
    end

    def set_card_number(deck_count)
        (1..deck_count).to_a
    end
    
    def pick
        @give_number = @card_number.sample
        @card_number.delete(@give_number)
        @give_number -= 1
    end

end