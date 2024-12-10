class Turn
    attr_reader :string, :card, :guess

        def initialize(string, card)
            @string = string
            @card = card 
        end

            def guess
                 return string 
            end

            def correct?
                 guess == card.answer
            end

            def feedback
                 correct? ? 'Correct!' : 'Incorrect.'
            end
        
    
end
