class Card
    attr_reader :question, :answer, :category

    # question = "What is the capital of Alaska?"
    # answer = "Juneau"
    # catagory = :Geography
    
    def initialize(question, answer, category)

    @question = question
    @answer = answer
    @category = category
    end
end

