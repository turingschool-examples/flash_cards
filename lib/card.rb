class Card
    
    attr_reader :question, :answer
    def initialize(question, answer)
        @question = question
        @answer = answer
    end

    def is_a_card
        if card.is_a?(Card) == true
            puts true
        else
            puts false
        end

end

