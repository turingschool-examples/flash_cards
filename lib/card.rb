# require './lib/turn' # - This fixed the bug for returning both to true!!!!!!
# require 'pry'

class Card
   attr_reader :fc_question
                :fc_answer
                :fc_category

 def initialize(fc_question, fc_answer, fc_category)
  @question = fc_question
  @answer = fc_answer
  @category = fc_category
 end
#binding.pry
 def question
   #binding.pry
    return @question
 end
# binding.pry
 def answer
  return @answer
end

def category
  return @category
end

end
