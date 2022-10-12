class Turn
    attr_reader :guess, :card

    def initialize(guess, card)
        @guess = guess
        @card = card
    end

    def correct?
        if @guess == @card.answer then true
        else false
        end
    end

    def feedback
        if @guess == @card.answer then p "Correct!"
        else p "Incorrect."
        end
    end
end



        


