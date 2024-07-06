class Turn
    attr_reader :guess, :card

    def initialize(guess, card)
        @guess = guess
        @card = card
        # result = true
    end

    def correct?(guess)
        if @guess == @answer
            true
        else
            false
        end
    end

    def feedback
        if guess.correct? == true
            p "Correct!"
        else
            p "Incorrect."
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
end