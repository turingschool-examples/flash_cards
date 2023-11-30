# Card class needs to have as attribute 
# (reader) @question, @answer and @category
# as methods: initialize
class Card 
    attr_reader :question,
                :answer,
                :category

    def initialize (question, answer, category)
        @question = question
        @answer = answer
        @category = category
    end
end