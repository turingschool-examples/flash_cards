class Card
   attr_reader :question,
   :answer,
   :category,
   :card_number
   
    def initialize (question, answer, category, card_number) 
    @question = question
    @answer = answer
    @category = category
    @card_number = card_number
   end

end

