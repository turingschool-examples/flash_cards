class Card
        attr_reader :question, :answer, :category

        def initalize(question, answer, category) 
        @question = question
        @answer = answer 
        @category = category
        end

    def add_question(question)
    @question << question 
    end 

    def add_answer(answer)
    @answer << answer 
    end

    def add_category(category)
    @category << answer
    end
end


