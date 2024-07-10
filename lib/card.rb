class Card
  attr_reader :card, :question, :answer

    def initialize(question, answer, card)
      @question = question
      @card = card
      @answer = answer
    end
  end
  