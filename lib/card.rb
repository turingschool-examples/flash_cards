
class Card

attr_reader :question,
            :answer,
            :category

def initialize(question, answer, category) #init variables for card class
  @question = question #assigning inits
  @answer = answer
  @category = category
end #end init method


  # def question
  #   puts "ian was here"
  #   @question
  # end #end method
#
#   def answer
#     @answer
#   end
#
#   def category
#     @category
#   end
end
#
# #to test initial
# card1 = Card.new("What is the element W?", "Tungsten", :science ) #creates new card

#to test failure



#begin calling methods
# card1.question
# card1.answer
# card1.category
