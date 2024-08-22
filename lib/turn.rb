class Turn
    attr_reader :answer,
                :card

    def initialize(answer,card)
        @answer = answer
        @card = card
    end
end