class Turn 
    attr_reader :guess, :card

    def initialize(guess, card)
        @guess = guess
        @card = card 
    end

    def correct? 
        @guess.strip.upcase == @card.answer.strip.upcase
    end

    def feedback # technically not using this method in game because I wanted to customize the feedback based on category
        if correct? 
            "Correct!"
        else 
            "Incorrect."
        end
    end
end