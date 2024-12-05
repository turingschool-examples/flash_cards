class Turn
    attr_reader :guess, :card

    def initialize(guess, card)
        @guess = guess
        @card = card
    end

    def correct? 
        @card.answer == @guess
        if guess == answer
            puts true
        else
            puts false
        end
    end
end
