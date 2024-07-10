class Card
    attr_reader ;card, ;question, ;answer

    Card = 
        Card.new = "What is the capitial of Alaska?, Juena"
        Card.new = "What is the biggest state?, Alaska"
        Card.new = "Where is Alaska located in the USA?, East"
    

    def initialize(question, answer, card)
      @question = question
      @card = card
      @answer = answer
    end
  end
  