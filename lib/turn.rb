class Turn
    attr_reader :guess, :card

    def initialize(answer, card)
        @guess = answer
        @card = card
    end

    def correct?
    end
end