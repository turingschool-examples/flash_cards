# create new calss called CardTest
class Card
# call the attr_accessor method, which  which is used to define attributes for instances of the class
  attr_reader :question, :answer, :category
# define the 'new' method, with 3 requested arguements
  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end
end
