class Turn
    attr_reader :card, :guess

    def initialize(card, guess)
        @card = card
        @guess = guess
    end

    def correct?
        @guess.downcase == @card.answer.downcase
        else
        false
    end

    def feedback
        @guess.correct == false
    end
end