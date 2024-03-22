require './lib/card'

class Turn
    attr_reader :string, 
                :card, 
                :guess
    
    def initialize(guess, card)
        @guess = guess
        @card = card 
    end

    def correct?
        @guess == card.answer
    end

    def feedback(string)
        if @guess.correct? == true
            puts "Correct!"
        else
            puts "Incorrect."
        end
    end

end

card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
turn = Turn.new("Juneau", card)
