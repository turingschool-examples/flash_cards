database = []
class Card
    def initialize(questionInput, answerInput, categoryInput)
        @question = questionInput
        @answer = answerInput
        @category = categoryInput
    end
    def question
        @question
    end
    def answer
        @answer
    end
    def category
        @category
    end
end

# cardA = Card.new("Who lives in a pineapple?", "Spongebob", :Geography)
# puts cardA.question