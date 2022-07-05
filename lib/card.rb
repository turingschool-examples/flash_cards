class Card
    attr_reader :question, :answer, :category
    def initialize(question, answer, category)
        @question = question
        @answer = answer
        @category = category
    end
end

class Turn
    attr_reader
    def initialize(guess, current_card)
        @guess = guess
        @current_card = current_card
    end
end

