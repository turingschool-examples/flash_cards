class Turn
    attr_reader :string, :card

    def initialize(string, card)
        @string = string
        @card = card
    end
        def guess
            return string
            end

            def correct?
            guess == card.answer
            # @card.answer == @guess
            end

            def feedback
            correct? ? 'Correct!' : 'Incorrect.'
            end
    
end