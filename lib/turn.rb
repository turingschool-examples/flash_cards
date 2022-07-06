class Turn
    attr_accessor :guess, :card, :feedback

    def initialize(string, card)
        @guess = string
        @card = card
        @feedback = ''
    end

    def correct?
        if @guess == @card.answer
            @feedback = 'Correct!'
            return true
        else
            @feedback = 'Incorrect.'
            return false
        end
    end
end

turn = Turn.new("Test", "test")
puts turn.guess