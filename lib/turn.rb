require './lib/card'

class Turn
    attr_reader :card, 
                :guess
    
    def initialize(guess, card)
        @guess = guess
        @card = card 
    end

    def correct?
        @guess == card.answer
    end

    def feedback
        if correct? == true 
            "Correct!"
        else
            "Incorrect."
        end
    end

end

card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
turn = Turn.new("Juneau", card)
