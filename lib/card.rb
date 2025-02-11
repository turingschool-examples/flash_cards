class Card

    attr_reader :question, :answer, :category
    
    def initialize(question, answer, category)
        @question = question
        @answer = answer
        @category = category
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

    card_one = Card.new(@question = "What is the capital of Alaska?", @answer = "Juneau", @category = ":Geography")
    card_two = Card.new(@question = "The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @answer = "Mars", @category =":STEM")    
    card_three = Card.new(@question = "Describe in words the exact direction that is 697.5° clockwise from due north?", @answer = "North north west", @category = ":STEM")  

end

