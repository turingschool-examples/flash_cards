class Turn

    attr_reader :card,
                :guess
                
        
     def initialize (card, guess)
        @card = card
        @guess = guess
     end

     def correct?
        @guess == @card.answer
        end
end