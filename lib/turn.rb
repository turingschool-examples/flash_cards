class Turn
    attr_reader :card, :guess

    def initialize(guess, card)
        @guess = guess
        @card = card
        @question = @card.question
        @answer = @card.answer
        @category = @card.category
    end

    def correct?
        @guess == @answer
    end

    def feedback
        if @guess == @answer
            "Correct!"
        else
            "Incorrect."
        end
    end
end