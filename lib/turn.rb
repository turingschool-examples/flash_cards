require './lib/card'

class Turn
    attr_reader :card,
                :question,
                :answer,
                :category,
                :guess

    def initialize()
        @card = card
        @question = question
        @answer = answer
        @category = category
        @guess = guess
    end

end