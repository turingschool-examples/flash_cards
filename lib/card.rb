# creates a Card class
class Card\
  # attribute reader and attributes
  attr_reader :queston, :answer, :category

  # initialization method and parameters
  def initialize(question, answer, category)
    # attributes
    @question = question
    @answer = answer
    @category = category
  end

end
