class Card
    attr_reader :question, :answer, :category

    def initialize(question, answer, category)
        @question = question
        @answer = answer
        @category = category
    end
end

#Creating the card?
card = Card.new("What is the capital of Alaska?", "Juneau", "Geography")

#Printing the Card
puts "Category: #{card.category}"
puts "Question: #{@question}"
puts "Answer: #{@answer}"