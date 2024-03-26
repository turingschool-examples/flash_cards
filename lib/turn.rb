class Turn
    attr_reader :guess, :card

    def initialize(guess, card)
        @guess = guess
        @card = card
    end

    def correct?
       if @guess == @card.answer
        return true
       else
        return false
       end
    end

    def feedback
        if correct? == true
            return "Correct!"
        else
            return "Incorrect."
        end
    end









end