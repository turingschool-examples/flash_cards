class Card
  attr_reader :question
  attr_reader :answer


    def initialize(question, answer, category)
      @question =  question
      @answer = answer
      @category = category
    end

    def question
      p @question
    end

    def answer
      p @answer
    end

    def category
      p @category
    end


end

card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

card.category
card.answer
card.question
