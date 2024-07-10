class Card
  attr_reader :card, :question, :answer, :guess

    def initialize(question, answer, card, guess)
      @question = question
      @card = card
      @answer = answer
      @guess = guess
    end
  end
  