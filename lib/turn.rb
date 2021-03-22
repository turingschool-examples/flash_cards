require './card'
class Turn
    attr_accessor :guess, :card

    def initialize(guess, card)
        @guess = guess
        @card = card
    end

    def correct?()
        guess.downcase == @card.answer.downcase
    end

    def feedback()
        if correct?
            "Correct!"
        else
            "Incorrect."
        end
    end
end