class Turn
    attr_reader :guess, :card

    def initialize(guess, card)
        @guess = guess
        @card = card
    end

    def correct? 
        @card.answer == @guess
    end

    def feedback
        if correct? 
            "Correct"
        else
            "Incorrect"
        end
    end

end



# For the Deck class, will the attr_reader
# be :objects (as the array) and :category ? 