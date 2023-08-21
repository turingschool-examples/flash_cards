class Card
    attr_reader :card_question, :card_answer, :card_category
    def initialize (card_question, card_answer, card_category)
        @card_question = card_question
        @card_answer = card_answer
        @card_category = card_category
    end
    def question
        @card_question
    end

    def answer
        @card_answer
    end

    def category
        @card_category
    end
end


card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)