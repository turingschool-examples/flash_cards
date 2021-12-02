# class Card
#   def initialize(question,answer,category)
#     @question = question
#     @answer = answer
#     @category = category
#   end
#
#   def question
#     @question
#   end
#
#   def answer
#     @answer
#   end
#
#
#  end

 class Card
   attr_reader :question, :answer, :category

   def initialize(question,answer,category)
     @question = question
     @answer = answer
     @category = category
   end

   # def category
   #   @category << category
   # end
   # def question
   #   @question
   # end
   #
   # # def answer
   # #   @answer
   # # end


  end
