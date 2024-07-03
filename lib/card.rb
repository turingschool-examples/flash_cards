class Card

    attr_reader :card, :question, :answer

    def initialize(card, question, answer)
        @card = card
        @question = "What is the capital of Alaska?"
        @answer = "Juneau"
    end
end
