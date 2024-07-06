class Turn
    attr_reader :guess, :card

    def initialize(guess, card)
        @guess = guess
        @card = card
        # result = true
    end

    def correct?
        if @guess == @card.answer
            true
        else
            false
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

# def card
    #     return @card
    # end

    # def correct?
    #     if Turn.guess == @card.answer
    #         result = true
    #     else
    #         result = false
    #     end
    # end

    # def feedback
    #     if result == true
    #         puts "Correct!"
    #     elsif result == false
    #         puts "Incorrect"
    #     else
    #         puts "Error, try again"
    #     end
    # end