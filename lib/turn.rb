class Turn
    attr_reader :guess, 

    def initialize(guess, card)
        @card = Card.new
        @guess = guess
    end

    def correct?
        return true if @guess == @answer
        false
    end

    def feedback
        return "Incorrect" if @guess == @answer
        "Correct"
    end
end