# check if you are in your flashcards project directory
def require
  path = #get current directory
  path = path + '/lib/card'
  return 
end


#create class Card
class Card
  # initialize variables
  attr_accessor :question, :answer, :category

  # initialize class
  def initialize(question, answer, category)
    self.question = question
    self.answer = answer
    self.category = category
  end



end
