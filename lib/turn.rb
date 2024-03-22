require './lib/card'

class Turn
    attr_reader :string, 
                :card, 
                :guess
    
    def initialize(string, card)
        @guess = string
        @card = card 

        def correct?(string)
            if @guess == card.answer
                @guess = true
            else 
                @guess = false
            end
        end

        def feedback(string)
            if @guess.correct? == true
                puts "Correct!"
            else
                puts "Incorrect."
            end
        end

    end 

end

card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
turn = Turn.new("Juneau", card)
