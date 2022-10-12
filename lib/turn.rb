class Turn
    attr_reader :guess, 
                :card

    def initialize(guess, card)
        @guess = guess
        @card = card
    end

    def correct?
        guess == card.answer
    end

    def feedback
        # require 'pry'; binding.pry
        correct? ? "Correct!" : "Incorrect."
        # return "Correct!" if correct?
        # "Incorrect."
    end
end