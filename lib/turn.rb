# turn.rb

class Turn

    attr_reader :string, :card

    def initialize (string, card)
        @string = string
        @card = card
    end

    def guess
        @string
    end

    def correct?
        if string == card.answer
            true
        else
            false
        end
    end

end