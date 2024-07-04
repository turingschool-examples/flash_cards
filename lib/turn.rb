class Turn
    attr_reader :string, :card

    def initialize(string, card)
        @string = string
        @card = card
    end

    def card
        return @card
    end

    def guess(string)
        guess = @string

    end

    def correct?
        if turn.guess == card.answer
            result = true
        else
            result = false
        end
    end

    def feedback
        if result == true
            puts "Correct!"
        elsif result == false
            puts "Incorrect"
        else
            puts "Error, try again"
        end
    end
end