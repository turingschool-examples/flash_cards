class Card
    attr_reader :question, :answer, :category
    def initialize(question, answer, category)
        @question = "What is the capital of Alaska?"
        @answer = "Juneau"
        @category = :Geography 
    end
end

