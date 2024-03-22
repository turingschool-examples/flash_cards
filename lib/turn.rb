require './lib/card.rb'

class Turn
    attr_reader :string, 
                :card, 
                :guess
    
    def initialize(string, card)
        @guess = string
        @card = card 

        def correct?
            if @guess == card.answer
                @guess = true
            else 
                @guess = false
            end
        end

        def feedback 
            if guess.correct? == true
                puts "Correct!"
            else
                puts "Incorrect."
            end
        end

    end 

end
   
turn = Turn.new("Juneau", card)
