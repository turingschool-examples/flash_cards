class Card
  attr_reader :question,
              :answer,
              :category
  def initialize(question, answer, category)
    @quesiton       = question
    @answer         = answer
    @category       = category
  end


  def question
    @question
  end 
end
